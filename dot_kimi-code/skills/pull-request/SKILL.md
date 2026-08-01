---
name: pull-request
description: "Open or update a PR after implementation is committed on a branch. Writes the PR body, links work items, runs the review loop, and handles CI feedback."
whenToUse: "Use after implementation is committed on a branch and the branch is ready for review."
---

# Pull Request

Use after a branch has committed work: a feature, or a standalone fix, perf, or refactor. Open a reviewable PR and keep it healthy until its checks resolve.

## Before opening

1. Confirm branch, base branch, and clean `git status`.
2. Review the full branch diff, not just the latest commit.
3. Run the full verification suite (formatter, linter, static analysis, tests, and the build command from `docs/project.md`), using the work item's Verification command as the baseline. Open only on green.
4. Run the review loop until it converges. Reviewer and fixer are separate agents so the review judgment stays independent of the fix:
   - **Parallel review:** Load the **graph-orchestrate** skill and fan out reviewers as background `Agent` calls when the diff touches multiple independent files or surfaces, one call per review axis (`code-reviewer`, `security-review`, `spec-review`). Merge findings before the next stage. See its `reference/review-loop.md` for the concrete graph.
   - **Specialized reviewers:** On a sensitive diff, also run **security-review**. When the item carries a spec, also run **spec-review**. A single reviewer runs as one foreground `Agent` call; several reviewers run as parallel background calls per graph-orchestrate.
   - Hand critical and warning findings to the **apply-review agent**, which fixes them, re-runs verification, and commits fixups.
   - Re-delegate to the reviewer, targeting regressions from the fixes, not fresh nitpicks. The loop ends when the reviewer returns no critical or warning findings.
   - Cap the review-fix loop at 3 iterations. Beyond that, report remaining findings to the user.
   - A finding apply-review cannot fix (structural decision, out of scope, reviewer misread) goes to the user or into the PR body **Notes**.
5. Confirm the tracker items this PR delivers are updated, and identify which it closes or references.

## PR body

```markdown
## Summary
- [concrete change]

## Test Plan
- [command actually run]

## Risk
[Low, or concrete risk: migration, data, auth, compatibility, performance]

## Breaking Changes
[None, or: what breaks, who is affected, migration or rollback path]

## Notes
[rollout, migration, follow-up, or "none"]
```

- Title follows the conventional commit message rule, free of issue numbers unless explicitly requested.
- Summary states user- or system-visible changes, not process; Test Plan lists only commands actually run.
- Call out migrations, breaking changes, auth or security impact, rollout, and follow-ups.
- Create the PR through the tracker MCP so linking is native.
- Repeat SRS, architecture, ADR, or item lists only where a reviewer needs the context.

## Watch loop

Watch only when something changes on its own: CI checks running, or reviewers who may respond. With neither, report the PR state and stop.

Pace each poll to how long the checks actually take. Widen the interval as the PR settles, and stop as soon as the exit condition holds.

Each pass:

1. Fetch checks and review threads through the tracker.
2. On a failed check, read the log and summarize the real failure. Fix it in scope, routing a real code defect to the **debug** agent and a scoped change to **coder**, then commit and push.
3. On actionable reviewer comments, address and commit; reply only when approved.
4. Re-run a failed job only when it is flaky or the fix is already pushed.

Exit when checks pass with every review thread addressed, or when a blocker needs the user.

## Done When

The PR is open or updated, carries a clear body, links the right items, and its tracker item is in review, with checks passing and no open review threads, or stopped on a blocker summarized with next steps. Durable findings are in memory.
