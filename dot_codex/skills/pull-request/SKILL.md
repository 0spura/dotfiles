---
name: pull-request
description: "Prepare a verified, reviewable pull request: inspect the full branch, run checks, orchestrate bounded reviews and fixups, link tracker work, and monitor only active checks or comments."
---

# Pull Request

## Before opening

1. Confirm the current branch, base branch, and working-tree status.
2. Inspect the complete branch diff, not only the latest commit.
3. Run the item's verification plus repository formatter, lint, static analysis, tests, and build when those checks exist. Open only with evidence from green checks.

Run `code-reviewer`; add `security-review` for sensitive surfaces. Give `code-reviewer` the tracker identifier so it loads the item once and checks the accepted goal, Implementation Surface, linked requirements or decisions, and Verification against the diff. These reviewers may run in parallel because they only read the same immutable diff. Fan in critical and warning findings, dispatch `apply-review` once, and re-review only the fix. Stop after three loops or escalate a structural decision. The code review checks caller-visible tests with independent oracles and decision trees changed by the branch.

Pass reviewers the branch or base reference, changed paths, and requirement IDs; let them inspect the diff themselves. Do not paste the full issue, session history, or duplicate diff into every reviewer prompt. Fan-in keeps only compact findings with priority, location, failure mode, and correction.

Create or update the PR through the tracker MCP when possible. Its body contains Summary, Test Plan (only commands run), Risk, Breaking Changes, and Notes. Monitor only checks or reviewer threads that can change independently; stop when all are resolved or report the blocker.

## Completion

Report the PR, verification evidence, unresolved findings, failed checks, missing permissions, and required user decisions.
