---
name: implementation
description: "Drive approved tracker work to verified commits by selecting the next unblocked item, preparing a safe branch or worktree, and dispatching the correct specialized agent."
---

# Implementation

The parent orchestrates; the dispatched agent implements. Dispatch only a bounded goal, verification, and implementation surface.

## Workflow

1. Inspect repository status and select the next unblocked item from tracker summaries. Do not fetch the full item body during selection.
2. Prepare the linked branch directly from the issue number.
3. Dispatch only the issue number, item type, and any bounded routing note; the selected execution agent owns the single full item read and its referenced context.
4. Verify the returned commit before selecting another item.

| Item | Agent | Completion gate |
| --- | --- | --- |
| `feat` | `worker` | focused test and verification pass |
| `refactor` | `worker` | baseline behavior remains green |
| `fix` | `debug` | reproduction and regression test pass |
| `perf` | `perf` | comparable measurement meets target |

Serialize writes by default. Use [reference/parallel-execution.md](reference/parallel-execution.md) only for proven-disjoint items in separate worktrees.

Stop for a structural decision, security choice, blocking defect, dirty unrelated worktree, or missing verification command. Do not silently change scope.

On completion, retain only the compact result, commit, and verification evidence for handoff. If the agent stops for a structural decision, resolve it with the user before re-invoking. If it stops for a blocking defect, report the failed approach and create a separate fix item.

The orchestrator must not reread the full item after dispatch. Consult it again only when the tracker confirms that its contract changed or when the returned result exposes a contradiction that cannot be resolved from the retained summary.
