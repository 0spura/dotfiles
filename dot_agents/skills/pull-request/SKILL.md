---
name: pull-request
description: Review a verified issue-linked branch, publish its change request through workctl, and reconcile delivery evidence with the issue.
---

# Pull Request

The request is delivery evidence for the same issue, not a new review ticket. The parent performs every remote write; reviewers return findings only.

Read `skill://plan/reference/workctl.md` for how workctl behaves: run it from inside the project, read errors' causes, write bodies on stdin, and read results back.

## Review the branch

1. Confirm the branch, its base, and the complete diff against the issue contract. Resolve the base and require a non-empty diff before spawning reviewers.
2. Run the contract's verification and the repository's applicable checks. Report skipped or unavailable evidence as such. Reuse an observed result only while it is still valid; never claim a check from another branch.
3. Request an independent `reviewer` pass with separate `Contract` and `Engineering` findings. Add `security-reviewer` when untrusted input or sensitive operations changed, and keep its findings separate. Give reviewers the issue contract, changed paths, base, and observed evidence, not session dumps or tracker-write authority.
4. Apply bounded findings, re-run the affected checks, and escalate structural contradictions. A finished review is not merge approval.

## Publish and reconcile

1. Read the change-request group's help (`workctl --help` names it). Check whether a request already exists for this branch and update it instead of creating a duplicate. Use the repository's template or `skill://pull-request/reference/body.md`, with issue identity, actual verification, risk, and unresolved findings. Pass the body through stdin with a quoted heredoc.
2. Link the issue with the creation option that help lists for linking or closing issues. A mention in prose is not a workflow link and will not close anything. Update an existing request with its own edit options.
3. Read the request back with its view command and confirm source, target, and issue link; the status command summarizes mergeability, review, and checks. Record the request's identity and verification on the issue and read that back.
4. Approved workflows own configured review and merge stage transitions. Look at `workflow status`/`actions` for warnings or pending work rather than repeating their effects. Never approve workflow rules, mark an uncertain write as applied, or authorize a replay without the user's authority and remote evidence.
5. Merge only when requested or allowed by the repository workflow and required checks and approvals pass. An auto-merge option only queues the merge. Confirm the merged state with the view command, and confirm issue closure or stage effects separately. Never close the issue just to make the tracker look done.

## Done when

For publication: the request links its issue and carries verification and unresolved findings. For an authorized merge: merged state and the contract's completion effects are observed. Report the remaining gates instead of claiming delivery early.

## Stop conditions

An invalid base, empty diff, missing contract, failed required check, unavailable provider, or absent merge authorization stops the affected action. After an uncertain create or merge, inspect remote state before retrying and never issue a duplicate write.
