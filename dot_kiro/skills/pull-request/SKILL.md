---
name: pull-request
description: Use after implementation is committed on a branch to open or update a PR, write the PR body, link work items, monitor checks, and handle CI feedback. Works for a feature or a standalone fix/perf/refactor.
---

# Pull Request

Use after a branch has committed work: a feature, or a standalone fix, perf, or refactor. Open a reviewable PR and keep it healthy until its checks resolve.

## Before opening

1. Confirm branch, base branch, and clean `git status`.
2. Review the full branch diff, not just the latest commit.
3. Run the full verification suite (formatter, linter, static analysis, tests, and the build command from `docs/project.md`), using the work item's Verification command as the baseline. Open only on green.
4. Run the review loop until it converges (see **graph-orchestrate** skill `reference/review-loop.md` for the full graph). Reviewer and fixer are separate agents so the review judgment stays independent of the fix:
   - Delegate to the **code-reviewer agent**. On a sensitive diff (auth, authorization, user data, payments, secrets, uploads, file access, external URLs, input handling), also delegate to the **security-review agent**. When the item carries a spec (SRS requirements or a PRD), also delegate to the **spec-review agent** for fidelity to what was asked. Merge the findings before handing them on.
   - Hand the critical and warning findings to the **apply-review agent**, which fixes them, re-runs verification, and commits fixups; a fix that breaks a test is caught in the same delegation.
   - Re-delegate to the reviewer, targeting regressions from the fixes, not fresh nitpicks. The loop ends when the reviewer returns no critical or warning findings; suggestions never block it.
   - A finding apply-review cannot fix (structural decision, out of scope, reviewer misread) goes to the user or into the PR body **Notes**; the loop moves on rather than spinning on it.
5. Confirm the tracker items this PR delivers are updated, and identify which it closes or references: parent and children for a feature, the single item otherwise.

Pass reviewers the branch or base reference, changed paths, and requirement IDs; let them inspect the diff themselves. Do not paste the full issue, session history, or duplicate diff into every reviewer prompt. Fan-in keeps only compact findings with priority, location, failure mode, and correction.

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

- Title in conventional commit format `<type>(<scope>): <description>` (see git-workflow), free of issue numbers unless explicitly requested.
- Summary states user- or system-visible changes, not process; Test Plan lists only commands actually run.
- Call out migrations, breaking changes, auth or security impact, rollout, and follow-ups.
- When a tracker MCP is configured, create the PR through it so linking is native; fall back to `gh pr create` only when no tracker MCP exists. Move the item to review via the native Status field, and treat a tracker write as done only after reading it back.

All work-item and PR operations go through the tracker MCP when available. Use native fields and relationships before labels, load each item once, and read every write back before treating it as complete.
- Repeat SRS, architecture, ADR, or item lists only where a reviewer needs the context.

## Watch loop

Watch only when something changes on its own: CI checks running, or reviewers who may respond. With neither, report the PR state and stop.

Drive the loop yourself, pacing each poll to how long the checks actually take, since an eight-minute suite is not worth polling every minute. Widen the interval as the PR settles, and stop as soon as the exit condition holds.

Each pass:

1. Fetch checks and review threads through the tracker; the result carries each check's status and, for failures, the tail of the failing job log inline, giving progress and diagnosis without the host CLI.
2. On a failed check, read the log and summarize the real failure. Fix it in scope, routing a real code defect to the **debug** agent and a scoped change to **implement-item**, then commit and push, and let the next pass confirm. Out of scope, stop and report the blocker.
3. On actionable reviewer comments, address and commit; reply only when approved.
4. Re-run a failed job only when it is flaky or the fix is already pushed.

Exit when checks pass with every review thread addressed, or when a blocker needs the user.

## Done When

The PR is open or updated, carries a clear body, links the right items, and its tracker item is in review, with checks passing and no open review threads, or stopped on a blocker summarized with next steps.
