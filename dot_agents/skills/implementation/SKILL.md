---
name: implementation
description: Execute an approved scoped change, tracked or untracked, and return verified evidence; use workctl only for tracker-backed work.
---

# Implementation

For tracked work, use the supplied issue, linked branch, base, acceptance, and verification as the contract. Otherwise, the current approved request and repository instructions are the contract; do not create a workctl item solely to implement it. The parent owns tracker writes and integration.

Read `skill://plan/reference/workctl.md` and use workctl only when an issue is supplied or tracking is explicitly required. Untracked work skips tracker and issue-branch commands.

## Start work

1. For tracked work, select the next unblocked issue and read its full contract and linked artifacts. For untracked work, follow the approved request; inspect the current branch and leave unrelated changes alone.
2. For tracked work, reuse the linked branch or create one with the documented workctl command. For untracked work, do not create a tracker branch or switch branches unless the user or repository workflow requires it.
3. Apply workflow and branch automation checks only when tracker-backed actions trigger them. Do not hand-edit automation results or approve rules to unblock yourself.

## Deliver the contract

1. Give each execution agent the issue identity and branch only when tracked; otherwise provide the approved request, scope, acceptance, non-goals, owned paths, and verification.
2. Route by type:

| Item | Agent | Completion gate |
| --- | --- | --- |
| `feat`, `refactor` | `worker` (`code-craft`) | focused verification; cite an SRS ID in a durable test when it defends that requirement |
| `fix`, `perf` | `fix` (`debugging`, then `code-craft`) | supported cause and regression proof, or comparable measurement meeting the target |
| research | `scout` | map with paths, lines, and ownership |
| pre-merge review | `reviewer`; also `security-reviewer` for sensitive surfaces | independent evidence-backed findings |

3. Parallelize only disjoint independent work using `skill://implementation/reference/parallel-execution.md`. Serialize shared-branch changes and tracker mutations when a tracker is in use.
4. Integrate results and exercise the specified behavior, including meaningful failures. Mark SRS requirements `Implemented` only when their named verification passes. Commit only when the assignment or repository workflow requires it.
5. Record evidence on the issue only for tracked work, then read it back. Otherwise return observed evidence and blockers to the caller. If a tracker command fails, act on the cause it prints.
6. Hand work to `pull-request` only when a change request is requested or required. Tracked deliveries retain issue identity; untracked work needs no tracker closure.

## Stop conditions

Stop for a structural or security decision, a blocking defect, missing verification, or conflicting worktree changes. An unavailable tracker blocks only work whose contract explicitly requires tracking.
