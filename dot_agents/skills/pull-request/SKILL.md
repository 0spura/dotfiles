---
name: pull-request
description: Review a verified issue-linked branch, publish its PR/MR through workctl, and reconcile delivery evidence with the canonical issue.
---

# Pull Request

Carry the target checkout, issue identity, branch/base, acceptance, and verification from `implementation`. The request is delivery evidence on that same issue, not a new review ticket. The parent owns all remote writes; reviewers return findings only.

## Review the branch

1. Confirm checkout, branch, base, and complete diff against the issue contract. Resolve the base and require a non-empty diff before spawning reviewers. Run workctl from the target checkout; it automatically resolves the repository there. Do not pass `--repo-path` for routine commands. Use `--repo-path PATH` only when intentionally operating on a different local checkout; never route by the agent's incidental directory.
2. Run the contract's verification and applicable repository checks. Report skipped or unavailable evidence explicitly. Reuse observed results when still valid; do not claim a check from another branch or artifact.
3. Request an independent `reviewer` pass with separate `Contract` and `Engineering` findings. Add `security-reviewer` when untrusted input or sensitive operations changed; keep security findings separate. Give reviewers the issue contract, changed paths, base, and observed evidence, not session dumps or tracker-write authority.
4. Apply bounded findings, re-run affected checks, and escalate structural contradictions. Do not treat review completion as merge approval.

## Publish and reconcile

1. Read the selected `pr` (GitHub) or `mr` (GitLab) command help. Inspect whether a request already exists for this branch before creating one; update it rather than duplicating it. Keep the repository template or `skill://pull-request/reference/body.md` with issue identity, actual verification, risk, and unresolved findings.
2. Link the issue explicitly when creating the request. GitHub can use `pr create --closes 123`; GitLab can use `mr create --related-issue 123`. Cross-repository/provider relationships and closing behavior must be supported and intentional; a prose mention is not proof of a workflow link or automatic closure. Use native update options from help for existing requests.
3. Read the created/updated request back through `pr view` or `mr view`; confirm source/target and issue linkage. The parent records request identity and verification on the canonical issue and reads it back. Retain target context on all commands; text is the default, JSON only for fields consumed by checks.
4. Approved workctl workflows own configured review/merge stage transitions and automation. Inspect status/actions for warnings or pending execution rather than repeating their effects. Never approve workflow rules, resolve uncertain writes as applied, or authorize replay without the required user authority and remote evidence.
5. Merge only when requested or authorized by the repository workflow and required checks/approvals pass. An auto-merge request is queued, not merged. Confirm actual merged state with `pr view` or `mr view` before reporting delivery; confirm issue closure or configured stage/time effects separately. Never close the issue just to make the tracker look finished.

## Done when

For a publication task, the request links its issue and carries verification and unresolved findings. For an authorized merge task, merged state and the contract's completion effects are observed. Report remaining gates without claiming delivery early.

## Stop conditions

Invalid target/base, empty diff, missing contract, failed required checks, unavailable provider, or absent merge authorization stops the affected action. After an uncertain create/merge, inspect remote state before retrying; never issue duplicate writes blindly.
