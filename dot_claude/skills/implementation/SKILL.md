---
name: implementation
description: "Drive an approved backlog to done. Selects the next unblocked item and dispatches it by type to the right agent — feature/refactor to implement-item, bug to debug, perf to perf."
---

# Implementation

Use this skill to drain an approved backlog, one unblocked item at a time. It is the **orchestrating loop** — it owns item selection, branch setup, concurrency safety, tracker updates, and checkpoints. Each item's execution runs in an agent, keeping build and investigation noise (file reads, test output, profiling) out of this loop so the context stays lean across many items.

The backlog is mixed: features, refactors, bugs, and perf items created by **implementation-plan**. The loop dispatches each by its type.

## Dispatch

An item's type — from its title prefix or native type field — decides the agent:

| Item type | Prefix | Agent | Gate |
|---|---|---|---|
| Feature | `feat` | implement-item | new focused test passes |
| Refactor | `refactor` | implement-item | baseline stays green (behavior frozen) |
| Bug | `fix` | debug | reproduction fixed + regression test |
| Performance | `perf` | perf | before/after benchmark meets target |

Feature and refactor are known changes — implement-item applies them. Bug and perf require empirical discovery at runtime (reproduce the defect, profile the bottleneck), which is why they route to their own agents.

## Method

The loop enforces SDD at the system layer: the SRS, architecture, and ADRs are the source of truth. An item that would diverge from them is not ready — settle the spec (or a new ADR) before dispatching it. The agents enforce their own task-layer gate (above).

## Git Isolation

- One branch per unit of work: a feature (`feat/<slug>`, linked to the parent item) or a standalone item (`fix|perf|refactor/<slug>`, linked to that item). Link through the tracker MCP before starting — use whatever branch-linking it exposes, without assuming a provider.
- Do not branch per child item or task within a feature.
- Use a worktree when the checkout is dirty, work is parallel, or switching would need a stash. Never nest worktrees.

## Concurrency Safety

The loop runs items **sequentially by default** — one agent at a time, each starting from the previous item's committed state. This is the safe mode: no two agents touch the working tree at once. It holds across types — a bug fix and a feature item that touch the same file must serialize just as two features would.

Only parallelize items that are provably independent. Before running two items concurrently, both must hold:

- **No relationship** — neither `blocks`, `blocked_by`, nor `related` links them in the tracker.
- **Disjoint Implementation Surface** — their declared files/modules do not overlap. If two items list the same file, they share state; serialize them.

Parallel items run in **separate worktrees**, never the same one. When in doubt, serialize — a shared file edited by two agents at once corrupts the work.

## Execution

1. Select the next open, unblocked item by tracker Status, Priority, and relationships. Prefer `Ready`; skip anything blocked.
2. Check `git status --short`; switch to the linked branch/worktree before delegating.
3. Dispatch by type (see Dispatch) — invoke the matching agent with the item spec and only the context it references.
4. Handle the agent's return:
   - **Completed:** mark the item done/closed in the tracker, record the commit and verification evidence, update any blockers or relationships. File any incidental findings the agent reported as new typed items.
   - **Stopped for a structural decision:** resolve the structure with the user, then re-invoke the agent with the decision.
   - **Stopped for a blocking defect** (during a feature/refactor item): file a `fix` item and route it to the debug agent; once fixed, re-invoke the original item.
5. Move to the next unblocked item.

## Done When

Every approved item is executed, verified, committed, and updated in the tracker. When a branch's work is committed — a feature's items, or a standalone fix/perf/refactor — use the **pull-request** skill.
