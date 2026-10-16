---
name: implementation
description: Execute an approved workctl issue on its linked branch, coordinate bounded agents, and carry verified evidence into the pull request.
---

# Implementation

Execution has one identity: the issue, its linked branch, base, acceptance, and verification. If any is missing, get it through `plan`; never implement from an issue title or summary alone. The parent owns tracker writes, branch lifecycle, and integration; execution agents receive the contract and return evidence.

Read `skill://plan/reference/workctl.md` for how workctl behaves. In short, run it from inside the project and it figures out the rest.

## Start work

1. Select the next unblocked issue, then `workctl issue view N` for its contract and linked artifacts. Confirm the worktree and current branch before editing; leave unrelated changes alone and stop if they obstruct a safe checkout.
2. Reuse the issue's existing branch when there is one. Otherwise run `workctl issue develop N --name short-slug --checkout`: the slug is short, lowercase, hyphenated, and describes the change; workctl prefixes the issue number. Verify the branch you are actually on, since creating a remote branch does not switch the worktree. After an uncertain result inspect with `issue develop N` (lists linked branches) and `git branch`; never recreate blindly.
3. Branch, change-request, and merge events may trigger the repository's approved workflows (stage moves, time tracking). Creating the branch is the trigger, not proof of a stage change. Check `workctl workflow status`/`actions` only when automation matters or a warning appeared. Do not hand-edit what automation does, and do not approve rules to unblock yourself.

## Deliver the contract

1. Give each execution agent the issue number, branch and base, type, scope, acceptance, non-goals, owned paths, and verification. Describe the result behaviorally, not as a file checklist. An agent needs the issue number and a brief, not workctl flags.
2. Route by type:

| Item | Agent | Completion gate |
| --- | --- | --- |
| `feat`, `refactor` | `worker` (`code-craft`) | focused verification; cite an SRS ID in a durable test when it defends that requirement |
| `fix`, `perf` | `fix` (`debugging`, then `code-craft`) | supported cause and regression proof, or comparable measurement meeting the target |
| research | `scout` | map with paths, lines, and ownership |
| pre-merge review | `reviewer`; also `security-reviewer` for sensitive surfaces | independent evidence-backed findings |

3. Parallelize only disjoint independent work using `skill://implementation/reference/parallel-execution.md`. Branch and tracker mutations stay serialized under the parent.
4. Integrate results and exercise the specified behavior, including meaningful failures. Mark SRS requirements `Implemented` only when their named verification passes. Commit only when the assignment or repository workflow requires it.
5. Record observed evidence and material blockers on the issue with its comment command, then read it back. Put multi-line evidence on stdin through a quoted heredoc. If a workctl command fails, act on the cause it prints.
6. Hand the verified branch, issue, base, checks, and open findings to `pull-request`. Finished coding is not a closed issue; completion follows the contract and confirmed remote state.

## Stop conditions

Stop for a structural or security decision, a blocking defect, an unavailable tracker, missing verification, or conflicting worktree changes. Record the real blocker on the issue when the tracker is reachable. After an unknown remote-write outcome, inspect before retrying; never duplicate a create or replay blindly.
