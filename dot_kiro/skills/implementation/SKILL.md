---
name: implementation
description: Drive an approved backlog to done. Selects the next unblocked item and dispatches it by type to the right agent.
---

# Implementation

Take approved work to done, one item at a time. This is the **orchestrating loop**: it selects work, prepares the branch, keeps concurrency safe, updates the tracker, and checkpoints with the user. Each item's execution runs inside a subagent.

## The loop delegates, never implements

Its job is selection, preparation, dispatch, integration, and bookkeeping; code, tests, and migrations happen in the agent it dispatches to.

## Dispatch

An item's type picks the agent:

| Item type | Prefix | Agent | Gate |
|---|---|---|---|
| Feature | `feat` | implement-item | new focused test passes |
| Refactor | `refactor` | implement-item | baseline stays green (behavior frozen) |
| Bug | `fix` | debug | reproduction fixed + regression test |
| Performance | `perf` | perf | before/after benchmark meets target |

## Branch and concurrency

- One branch per unit of work: a feature (`feat/<slug>`) or a standalone item (`fix|perf|refactor/<slug>`).
- The loop runs items **sequentially by default**: one agent at a time. Parallelize only items that are provably independent: no links between them and disjoint Implementation Surfaces.

## Execution

1. **Frame the work.** The next open, unblocked item by tracker status and priority.
2. **Shape it** if needed, so every item carries a type and a verification command before dispatch.
3. **Prepare git:** `git status --short`, then switch to the linked branch or worktree.
4. **Dispatch** to the agent for the item's type.
5. **Handle the return:**
   - **Completed:** mark done in the tracker with commit and verification evidence.
   - **Stopped for a structural decision:** resolve it with the user, then re-invoke.
   - **Stopped for a blocking defect:** file a `fix` for the debug agent.
6. **Move on** to the next unblocked item.

## Done When

Every approved item is executed, verified, committed, and updated in the tracker. Once a branch's work is committed, use the **pull-request** skill.
