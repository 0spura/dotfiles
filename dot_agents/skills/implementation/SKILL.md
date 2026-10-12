---
name: implementation
description: Execute approved workctl issue contracts on linked branches, coordinate bounded agents, and carry verified evidence into PR/MR review.
---

# Implementation

Execution keeps one identity: target checkout, canonical issue, linked branch, base, acceptance, and verification. Bind it through `plan` if missing; never implement from an issue summary alone. The parent owns tracker writes and integration; execution agents receive the contract and return evidence.

## Start work

1. Select the next unblocked issue and read its contract and linked artifacts. Use workctl in the target checkout or retain `--repo-path PATH` for every tracker operation. Confirm the worktree and current branch before editing; leave unrelated changes untouched and stop if they obstruct safe checkout or integration.
2. Reuse an existing branch for this issue when its identity and checkout are established. Otherwise read `issue develop --help`, choose a short representative lowercase hyphenated slug without the ID, and create/check out the linked branch: `workctl issue develop 123 --name parser-crash --checkout`. Workctl prefixes the issue ID. Verify the actual branch; listing or creating a remote branch alone does not switch the worktree. Do not recreate a branch after an uncertain result: inspect linked branches and local state first.
3. Let configured, locally approved workctl workflows handle branch/PR/merge-driven stages and supported time tracking. Branch creation is not proof that a stage changed. Inspect workflow status/actions when automation is relevant or reports a warning; do not duplicate automatic mutations, invent timers, or approve rules merely to unblock execution. Missing automation is not a reason to change repository configuration without authorization.

## Deliver the contract

1. Give each execution agent the target, issue identity, branch/base, type, scope, acceptance, non-goals, owned paths, and verification. Describe the result behaviorally, not as a file checklist.
2. Route by type:

| Item | Agent | Completion gate |
| --- | --- | --- |
| `feat`, `refactor` | `worker` (`code-craft`) | focused verification; cite an SRS ID in a durable test when it defends that requirement |
| `fix`, `perf` | `fix` (`debugging`, then `code-craft`) | supported cause and regression proof, or comparable measurement meeting the target |
| research | `scout` | map with paths, lines, and ownership |
| pre-merge review | `reviewer`; also `security-reviewer` for sensitive surfaces | independent evidence-backed findings |

3. Parallelize only disjoint independent work using `skill://implementation/reference/parallel-execution.md`. Keep tracker and branch lifecycle mutations serialized under the parent; children never create branches or switch the shared worktree independently.
4. Integrate results and exercise the specified behavior, including meaningful failures. Mark SRS requirements `Implemented` only when their named verification passes. Commit only when the assignment or repository workflow requires it.
5. The parent records observed evidence and material blockers on the canonical issue and reads it back. GitHub uses `issue comment`/`issue edit`; GitLab uses `issue note`/`issue update`; consult the selected help, not another provider's spelling. Keep status output compact; use JSON only when consuming exact fields.
6. Hand the verified branch, issue identity, base, checks, and remaining findings to `pull-request`. Do not close the issue merely because coding finished or PR creation succeeded; completion follows the issue's delivery contract and confirmed remote state.

## Stop conditions

Stop for a structural/security decision, blocking defect, unavailable tracker, missing verification, or conflicting worktree changes. Record the actual blocker through the parent when reachable. Unknown remote-write outcomes require inspection before retry, never a duplicate create or blind replay.
