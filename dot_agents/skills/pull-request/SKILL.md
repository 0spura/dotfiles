---
name: pull-request
description: Review verified branch changes and publish or reconcile a requested change request through workctl. Use only when review or PR publication is requested or required by repository workflow.
---

# Pull Request

Verify the full branch diff independently, then publish or reconcile the change request cleanly without duplicating remote state.

Read `skill://plan/reference/workctl.md` when publishing or updating a PR, and `skill://pull-request/reference/body.md` if the repository has no PR template.

## House rules

1. **Parent owns all remote writes.** Reviewers return findings only; never let a reviewer mutate remote or tracker state.
2. **Non-empty diff against a resolved base.** Confirm branch, base, and non-empty diff before spawning any reviewer.
3. **Update, never duplicate.** Always check for an existing PR on the branch before creating a new one.
4. **Separate review, queue, and merge.** A clean review is not merge approval; auto-merge only queues a merge; confirm merged state and issue effects separately.
5. **Inspect before retrying.** After any uncertain remote create or merge, read remote state before retrying.

## Phase 1 — Review the branch

1. **Confirm diff & checks.** Verify branch, base, and full diff against the contract. Run required checks; report skipped/unavailable checks honestly and never reuse results from another branch.
2. **Run independent review & simplification.** Spawn `simplifier` when the diff has messy/complex recent code worth cleaning without behavior changes, and spawn `reviewer` for concrete bug/smell findings. Add `security-reviewer` whenever untrusted input, auth, or sensitive operations changed; keep security findings separate. Pass the contract, changed paths, base, and observed evidence.
3. **Apply bounded fixups.** Fix concrete findings, re-run affected checks, and escalate structural contradictions.

## Phase 2 — Publish & reconcile (only when requested or required)

1. **Prepare PR body.** Check `workctl --help` for the PR command group. Use the repo template (or `skill://pull-request/reference/body.md`) and pass the body via stdin.
2. **Create or update.** Check for an existing PR for this branch first. Link the canonical issue only when tracked (never create an issue just to open a PR).
3. **Read back.** Confirm source branch, target branch, and status from remote output; record PR identity on the issue only when tracked.
4. **Respect configured workflows.** Inspect `workflow status`/`actions` for warnings or pending transitions rather than duplicating their effects.
5. **Merge only when authorized.** Require explicit authorization plus passing checks/approvals. Confirm final merged state via the view command.

## Stop conditions

Stop the affected review or publish action on: invalid base, empty diff, missing contract, failed required check, unavailable provider, or absent merge authorization.

## Never

- Claim check results observed on another branch or before the latest commit.
- Approve workflow rules, fabricate remote state, or replay an uncertain write without inspecting remote state first.
- Close an issue manually just to make the tracker look finished.

## Output

Review findings (or clean confirmation), verification evidence, PR link/state (if published), and any blockers.
