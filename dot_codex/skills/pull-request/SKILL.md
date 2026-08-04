---
name: pull-request
description: "Prepare a verified, reviewable pull request: inspect the full branch, run checks, orchestrate bounded reviews and fixups, link tracker work, and monitor only active checks or comments."
---

# Pull Request

## Before opening

1. Confirm the current branch, base branch, and working-tree status.
2. Inspect the complete branch diff, not only the latest commit.
3. Run the item's verification plus repository formatter, lint, static analysis, tests, and build when those checks exist. Open only with evidence from green checks.

Fan out read-only review: always `code-reviewer`; add `security-review` for sensitive surfaces and `spec-review` for cited requirements. Merge critical and warning findings, dispatch `apply-review`, and re-review only the fixes. Stop after three loops or escalate a structural decision. See [reference/review-loop.md](../graph-orchestrate/reference/review-loop.md).

Create or update the PR through the tracker MCP when possible. Its body contains Summary, Test Plan (only commands run), Risk, Breaking Changes, and Notes. Monitor only checks or reviewer threads that can change independently; stop when all are resolved or report the blocker.

## Completion

Report the PR, verification evidence, unresolved findings, failed checks, missing permissions, and required user decisions.
