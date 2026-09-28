---
name: pull-request
description: Prepare a verified, reviewable pull request after implementation and drive its review cycle. Use when a branch is ready for review; not to design or implement the change.
---

# Pull Request

## Workflow

1. Confirm branch, base, status, and the complete diff against the item's contract, and move the item to the configured review stage. Resolve the base reference and confirm the diff is non-empty before spawning anything: a bad ref or an empty diff fails here, not inside two reviewers.
2. Run the item's verification and the applicable repository checks; report skipped evidence as skipped, and record a missing contract or specification as unavailable rather than reconstructing one.
3. Spawn `reviewer` for an independent contract/spec pass and engineering/repository-standards pass; keep findings under separate `Contract` and `Engineering` headings. Spawn `security-reviewer` only when the diff touches untrusted input or a sensitive operation; restrict it to security controls and vulnerabilities. Do not ask the general reviewer for a second security audit. Give each reviewer changed paths, acceptance criteria, and the base reference, not copied session history; keep security findings separate from both axes and never merge or rerank findings across reviewers.
4. Apply bounded findings once, re-run the affected checks, and escalate a structural contradiction rather than looping.
5. Create or update the PR through the repository's normal system, preserving its template when one exists, otherwise `skill://pull-request/reference/body.md`.

## Done when

The PR links its item and carries verification evidence, unresolved findings, and failed checks.
