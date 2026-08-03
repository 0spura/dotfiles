---
name: implementation
description: "Drive approved tracker work to verified commits by selecting the next unblocked item, preparing a safe branch or worktree, and dispatching the correct Codex subagent."
---

# Implementation

The parent orchestrates; the dispatched agent implements. Shape direct requests into goal, verification, and implementation surface before dispatch.

## Workflow

1. Read the tracker item, linked requirements, architecture, ADRs, and current repository status.
2. Select the next unblocked item by status, priority, and relationships. Do not bypass a blocker.
3. Prepare the linked branch or worktree and dispatch only the context needed by the selected agent.
4. Verify the returned commit and update the tracker with evidence before selecting another item.

| Item | Agent | Completion gate |
| --- | --- | --- |
| `feat` | `worker` | focused test and verification pass |
| `refactor` | `worker` | baseline behavior remains green |
| `fix` | `debug` | reproduction and regression test pass |
| `perf` | `perf` | comparable measurement meets target |

Select the next unblocked item, confirm clean git state, then dispatch with only referenced context. Record completion, commit, verification evidence, and newly discovered blockers in the tracker. Serialize writes by default. Use [reference/parallel-execution.md](reference/parallel-execution.md) only for proven-disjoint items in separate worktrees.

Stop for a structural decision, security choice, blocking defect, dirty unrelated worktree, or missing verification command. Do not silently change scope.

On completion, update status, commit, verification evidence, relationships, and blockers before dispatching another item. If the agent stops for a structural decision, resolve it with the user before re-invoking. If it stops for a blocking defect, record the failed approach and create a separate fix item.
