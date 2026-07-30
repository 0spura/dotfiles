# Review Loop Graph Example

This is a concrete graph for the PR review-fix loop. It uses `AgentSwarm` for parallel reviews and `Agent` for fix application.

## Nodes

- **N1 review swarm**: runs `code-reviewer`, `security-review`, and `spec-review` in parallel over the same diff.
- **N2 merge findings**: parent merges the three reports into one prioritized list.
- **N3 gate**: if no critical or warning findings, exit.
- **N4 apply fixes**: `apply-review` receives the merged findings and the diff.
- **N5 re-review swarm**: runs the same reviewers again, scoped to regressions only.

## Edges

```
N1 --(findings)--> N2 --(merged findings)--> N3
N3 --(has blockers)--> N4 --(fixed diff)--> N5 --(findings)--> N2
N3 --(clean)--> exit
```

## Guard

Max 3 iterations. After the third, report remaining findings to the user instead of looping.

## AgentSwarm template for N1

```
prompt_template: |
  Review the current branch diff for {{item}} issues.
  Return findings grouped by priority (critical / warning / suggestion).
  Do not modify files.
items:
  - "bugs and design problems"
  - "security vulnerabilities (only if the diff touches auth, data, payments, secrets, uploads, file access, URLs, or input handling)"
  - "spec fidelity to docs/srs.md and any cited ADRs"
subagent_type: code-reviewer
model: primary
```

Use `security-review` and `spec-review` profiles instead of routing all through `code-reviewer` when you want specialized tools.
