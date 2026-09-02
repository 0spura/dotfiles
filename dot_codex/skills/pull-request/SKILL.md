---
name: pull-request
description: "Prepare a verified, reviewable pull request: inspect the full branch, run checks, link its issue, and resolve bounded review findings."
---

# Pull Request

## Verify and open

1. Confirm branch/base/status and inspect the complete diff.
2. Run the item's verification and applicable repository checks. Open only with evidence; report skipped checks.

Run `code-reviewer`; add `security-review` for sensitive surfaces. Give `code-reviewer` the issue number so it loads the issue once and checks its accepted goal, Implementation Surface, linked requirements/decisions, and Verification against the diff. These reviewers may run in parallel because they only read the same immutable diff. Fan in findings, dispatch `apply-review` once, and re-review only the fix. Stop after three loops or escalate a structural decision.

Pass reviewers the branch or base reference, changed paths, and requirement IDs; let them inspect the diff themselves. Do not paste the full issue, session history, or duplicate diff into every reviewer prompt. Fan-in keeps only compact findings with priority, location, failure mode, and correction.

Create or update the PR through the issue system. Its body contains Summary, Test Plan (only commands run), Risk, Breaking Changes, and Notes. Monitor only checks or reviewer threads that can change independently; stop when all are resolved or report the blocker.

## Completion

Report the PR, verification evidence, unresolved findings, failed checks, missing permissions, and required user decisions.
