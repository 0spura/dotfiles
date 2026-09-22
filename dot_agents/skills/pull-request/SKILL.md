---
name: pull-request
description: Prepare a verified, reviewable pull request after implementation and drive its review cycle. Use when a branch is ready for review; not to design or implement the change.
---

# Pull Request

## Workflow

1. Confirm branch, base, status, and the complete diff against the item's contract, and move the item to the configured review stage.
2. Run the item's verification and the applicable repository checks; report skipped evidence as skipped.
3. Spawn `reviewer` for the independent code review, and `security-reviewer` when the diff touches untrusted input or a sensitive operation. Give them changed paths, acceptance criteria, and the base reference, not copied session history.
4. Apply bounded findings once, re-run the affected checks, and escalate a structural contradiction rather than looping.
5. Create or update the PR through the repository's normal system, preserving its template when one exists, otherwise `skill://pull-request/reference/body.md`.

## Done when

The PR links its item and carries verification evidence, unresolved findings, and failed checks.
