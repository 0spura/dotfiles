---
name: pull-request
description: Review verified changes and publish a requested change request through workctl; this workflow does not require a pull request for every implementation.
---

# Pull Request

For tracked delivery, the request is evidence for the same issue, not a new review ticket. For untracked delivery, use the approved request as the contract. The parent performs every remote write; reviewers return findings only.

Read `skill://plan/reference/workctl.md` when publishing or updating a change request; workctl is not needed for review-only or ordinary implementation work.

## Review the branch

1. Confirm the branch, base, and complete diff against the issue when tracked, or against the approved request otherwise. Resolve the base and require a non-empty diff before spawning reviewers.
2. Run the contract's verification and the repository's applicable checks. Report skipped or unavailable evidence as such. Reuse an observed result only while it is still valid; never claim a check from another branch.
3. Request an independent `reviewer` pass with separate `Contract` and `Engineering` findings. Add `security-reviewer` when untrusted input or sensitive operations changed, and keep findings separate. Give reviewers the issue contract when tracked or the approved task contract otherwise, plus changed paths, base, and evidence.
4. Apply bounded findings, re-run the affected checks, and escalate structural contradictions. A finished review is not merge approval.

## Publish and reconcile

1. Publish only when explicitly requested or required by repository workflow. Read the change-request group's help (`workctl --help` names it), check for an existing request for this branch, and update rather than duplicate. Use the repository template and pass the body through stdin.
2. Link the issue when the delivery is tracked. Do not create a tracker item solely to publish a requested change request; use the supported workctl options and read the result back.
3. Read the request back and confirm source, target, and status. Record its identity and verification on the issue only when tracked.
4. Approved workflows own configured review and merge stage transitions. Look at `workflow status`/`actions` for warnings or pending work rather than repeating their effects. Never approve workflow rules, mark an uncertain write as applied, or authorize a replay without the user's authority and remote evidence.
5. Merge only when requested or allowed by the repository workflow and required checks and approvals pass. An auto-merge option only queues the merge. Confirm the merged state with the view command, and confirm issue closure or stage effects separately. Never close the issue just to make the tracker look done.

## Done when

For publication, the requested change is verified and carries observed evidence; reconcile it with the issue only when tracked. For an authorized merge, confirm merged state and the contract's completion effects.

## Stop conditions

An invalid base, empty diff, missing task contract, failed required check, unavailable provider, or absent merge authorization stops only the affected review or publication action. After an uncertain create or merge, inspect remote state before retrying and never duplicate a write.
