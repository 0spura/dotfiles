---
name: implementation
description: Coordinate approved tracker work to verified commits. Use only when the task is tracker-backed or has multiple bounded implementation items.
---

# Implementation

The linked tracker item is the current contract. The parent coordinates; an
execution agent owns one bounded goal, verification, and implementation surface.

## Workflow

1. Inspect repository status, choose the next unblocked item from summaries,
   and read its contract once.
2. Prepare an isolated branch or worktree only when the repository workflow or
   concurrent work requires it.
3. Dispatch the item identifier, type, bounded routing note, and verification.
4. Verify the returned result before selecting another item.

| Item | Agent | Completion gate |
| --- | --- | --- |
| `feat` | `worker` | focused test and verification pass |
| `refactor` | `worker` | baseline behavior remains green |
| `fix` | `debug` with `debugging` | reproduction and regression test pass |
| `perf` | `perf` | comparable measurement meets target |

Serialize writes by default. Use [reference/parallel-execution.md](reference/parallel-execution.md)
only for proven-disjoint items in separate worktrees.

Stop for a structural decision, security choice, blocking defect, dirty unrelated worktree, or missing verification command. Do not silently change scope.

On completion, record the compact result, commit, verification, blocker, and
next item with `record_work` using phase `implementation`. If a structural
decision or blocker emerges, resolve or report it before continuing.
