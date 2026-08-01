# Review Loop Graph Example

This is a concrete graph for the PR review-fix loop. It fans out review nodes as background `Agent` calls and applies fixes with a foreground `Agent` call.

## Nodes

- **N1 review fan-out**: dispatches `code-reviewer`, `security-review`, and `spec-review` as three background `Agent` calls over the same diff.
- **N2 merge findings**: parent merges the three reports into one prioritized list, once all three notifications or `TaskOutput` calls resolve.
- **N3 gate**: if no critical or warning findings, exit.
- **N4 apply fixes**: `apply-review` (foreground `Agent` call) receives the merged findings and the diff.
- **N5 re-review fan-out**: runs the same three reviewers again, scoped to regressions only.

## Edges

```
N1 --(findings)--> N2 --(merged findings)--> N3
N3 --(has blockers)--> N4 --(fixed diff)--> N5 --(findings)--> N2
N3 --(clean)--> exit
```

## Guard

Max 3 iterations. After the third, report remaining findings to the user instead of looping. If a review node is still running when the guard trips, cancel it with `TaskStop`.

## Dispatch for N1 / N5

Three background `Agent` calls, each with a profile-specific prompt over the same diff:

```
Agent(subagent_type: code-reviewer, run_in_background: true, prompt: "
  Review the current branch diff for bugs and design problems.
  Return findings grouped by priority (critical / warning / suggestion).
  Do not modify files.
")

Agent(subagent_type: security-review, run_in_background: true, prompt: "
  Review the current branch diff for security vulnerabilities, only if it
  touches auth, data, payments, secrets, uploads, file access, URLs, or
  input handling. Otherwise say so and stop.
")

Agent(subagent_type: spec-review, run_in_background: true, prompt: "
  Review the current branch diff for fidelity to docs/srs.md and any
  cited ADRs.
")
```

Collect each result from its completion notification, or from `TaskOutput` if you need to check a task that has gone quiet. Do not block on one before dispatching the others.

For N5, add "target regressions from the fixes only, not fresh nitpicks" to each prompt.
