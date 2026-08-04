---
name: implementation
description: Drive an approved backlog to done. Selects the next unblocked item and dispatches it by type to the right agent, sending feature and refactor to implement-item, bug to debug, and perf to perf.
---

# Implementation

Take approved work to done, one item at a time. This is the **orchestrating loop**: it selects work, prepares the branch, keeps concurrency safe, updates the tracker, and checkpoints with the user. Each item's execution runs inside a subagent, keeping build and investigation noise out of the loop so its context stays lean across many items.

The work is usually an approved backlog of mixed items (features, refactors, bugs, perf) from **implementation-plan**. A direct request to do a single issue enters the same way, shaped into an item first.

## The loop delegates, never implements

The one rule the loop is built around. Its job is selection, preparation, dispatch, integration, and bookkeeping; code, tests, and migrations happen in the agent it dispatches to, and that division is what keeps the context lean. When an item cannot be dispatched (no agent matches its type, or it is too unshaped to hand over), stop and resolve that; implementing inline is never the fallback.

## Dispatch

An item's type, from its title prefix or native type field, picks the agent:

| Item type | Prefix | Agent | Gate |
|---|---|---|---|
| Feature | `feat` | implement-item | new focused test passes |
| Refactor | `refactor` | implement-item | baseline stays green (behavior frozen) |
| Bug | `fix` | debug | reproduction fixed + regression test |
| Performance | `perf` | perf | before/after benchmark meets target |

Feature and refactor are known changes, so implement-item applies them. Bug and perf need empirical discovery at runtime (reproduce the defect, profile the bottleneck), so they route to their own agents.

The parent owns tracker orchestration. Use the tracker MCP for item lookup, branch/work-item linking, status changes, relationships, and completion evidence. Do not replace tracker operations with a host CLI shortcut when the MCP exposes the operation.

## Shaping before dispatch

An item is ready when it has a type and enough spec to hand over: a goal, a verification command, and the Implementation Surface it may touch. Backlog items arrive ready. A direct issue does not, so shaping it is the loop's first step:

- Run it through **implementation-plan** for a proper item, or, for a genuinely small change, inline a minimal spec: goal, verification command, files it may touch.
- Take the verification command from the item; with none, use the narrowest check that proves the change (a single test target, or the typecheck or compile of the touched module) and name it.

An item that would diverge from the SRS, architecture, or an ADR is unresolved, not shaped, so settle the spec or a new ADR before dispatching. Shaping produces the spec; the agent produces the code.

## Branch and concurrency

- One branch per unit of work: a feature (`feat/<slug>`) or a standalone item (`fix|perf|refactor/<slug>`), linked to its item through the tracker MCP before starting. Not one branch per child item. Use a worktree when the checkout is dirty or the work is parallel; never nest worktrees.
- The loop runs items **sequentially by default**: one agent at a time, each starting from the previous item's committed state, so no two agents touch the working tree at once. This holds across types: a bug fix and a feature item on the same file serialize just as two features would.
- Parallelize only items that are provably independent: no `blocks`, `blocked_by`, or `related` link between them, and disjoint Implementation Surfaces. Items sharing a file share state, so they serialize. Running a batch (separate worktrees, `_par/*` integration branches, merge and re-verify) follows `reference/parallel-execution.md` and the **graph-orchestrate** skill's fan-out pattern. When in doubt, serialize.

## Execution

1. **Frame the work.** From tracker summaries, select the next open, unblocked item by Status, Priority, and relationships (prefer `Ready`, skip blocked). Do not fetch full item bodies during selection. From a direct request, use the named item identifier. Provably independent items can go as a parallel batch.
2. **Shape it** if needed, so every item carries a type and a verification command before dispatch.
3. **Prepare git:** `git status --short`, then switch to the linked branch or worktree.
4. **Dispatch** only the item identifier, type, and bounded routing note to the agent for its type. The execution agent owns the single full item read and its referenced context.
5. **Handle the return:**
   - **Completed:** mark the item done in the tracker with the commit and verification evidence, update blockers and relationships, and file any incidental findings as new typed items.
   - **Stopped for a structural decision:** resolve it with the user, then re-invoke the agent with the decision.
   - **Stopped for a blocking defect:** record the failed approach on the item so a re-attempt skips it, file a `fix` for the debug agent, and re-invoke the original once fixed.
6. **Move on** to the next unblocked item or batch.

Do not reread the full item after dispatch. Before moving on, verify the returned commit, tests, and verification evidence, update the item through the tracker MCP, and read back only the compact tracker summary needed to confirm the write. Never mark an item complete from an agent summary alone.

Fetch the full item again only when the tracker confirms that its contract changed or the result exposes a contradiction that cannot be resolved from the retained summary.

## Done When

Every approved item is executed, verified, committed, and updated in the tracker. Once a branch's work is committed, use the **pull-request** skill.
