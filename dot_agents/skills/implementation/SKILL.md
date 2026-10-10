---
name: implementation
description: Coordinate approved tracker work to verified commits with bounded parallelism. Use when the work is tracker-backed or has several bounded items.
---

# Implementation

The linked item is the contract. The parent coordinates; one execution agent owns one bounded goal with its verification.

Use `workctl` with repository-configured providers and the selected command's `--help`. The parent owns tracker writes; execution agents return evidence and proposed updates.

## Workflow

1. Choose the next unblocked item and give its agent the identifier, type, scope, acceptance, out-of-scope, and verification. Describe the outcome behaviorally; include known paths only to bound write ownership or review scope, never as the acceptance criterion.
2. Route by type:

| Item | Agent | Completion gate |
| --- | --- | --- |
| `feat`, `refactor` | `worker` (`code-craft`) | focused verification; cite an SRS ID in a durable test when that test defends the requirement |
| `fix`, `perf` | `fix` (`debugging` then `code-craft`) | supported cause and regression proof, or a comparable measurement meeting the target |
| research | `scout` | map with paths, lines, and ownership |
| pre-merge review | `reviewer`; also `security-reviewer` for sensitive surfaces | independent, evidence-backed findings from each reviewer |

3. Verify the returned result, the current diff, and the focused checks before selecting the next item, and mark a requirement `Implemented` in the SRS only where its named verification passes.
4. Parallelize only proven-disjoint items, following `skill://implementation/reference/parallel-execution.md`; keep isolated workspaces off unless the repository workflow requires them.
5. The parent records evidence on the canonical issue, then confirms with `workctl issue view 123`. Examples: GitHub `workctl issue comment 123 --body "Verified: …"`; GitLab `workctl issue note 123 --message "Verified: …"`. Use `issue edit` or `issue update` for metadata. Report only observed evidence.
6. Write any approved durable record following `documentation-style`.
7. Route the verified branch to `pull-request` for the review cycle.

## Stop conditions

Stop for a structural decision, security choice, blocking defect, dirty unrelated worktree, unavailable tracker, or missing verification command, and return the blocker with the next unblocked item.
