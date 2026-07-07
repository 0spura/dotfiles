---
name: implementation
description: "Drive an approved backlog to done. Selects the next unblocked item and dispatches it by type to the right agent: feature/refactor to implement-item, bug to debug, perf to perf."
---

# Implementation

Use this skill to drain an approved backlog, one unblocked item at a time. It is the **orchestrating loop**: it owns item selection, branch setup, concurrency safety, tracker updates, and checkpoints. Each item's execution runs in an agent, keeping build and investigation noise (file reads, test output, profiling) out of this loop so the context stays lean across many items.

The backlog is mixed (features, refactors, bugs, and perf items created by **implementation-plan**). The loop dispatches each by its type.

## Dispatch

An item's type, taken from its title prefix or native type field, decides the agent:

| Item type | Prefix | Agent | Gate |
|---|---|---|---|
| Feature | `feat` | implement-item | new focused test passes |
| Refactor | `refactor` | implement-item | baseline stays green (behavior frozen) |
| Bug | `fix` | debug | reproduction fixed + regression test |
| Performance | `perf` | perf | before/after benchmark meets target |

Feature and refactor are known changes, so implement-item applies them. Bug and perf require empirical discovery at runtime (reproduce the defect, profile the bottleneck), which is why they route to their own agents.

## Method

The loop enforces SDD at the system layer: the SRS, architecture, and ADRs are the source of truth. An item that would diverge from them is not ready; settle the spec (or a new ADR) before dispatching it. The agents enforce their own task-layer gate, listed above.

## Git Isolation

- One branch per unit of work: a feature (`feat/<slug>`, linked to the parent item) or a standalone item (`fix|perf|refactor/<slug>`, linked to that item). Link through the tracker MCP before starting, using whatever branch-linking it exposes without assuming a provider.
- Do not branch per child item or task within a feature.
- Parallel items are the one exception, and only internally: each runs on a short-lived integration branch `_par/<item-slug>` cut from the feature HEAD, in its own worktree, merged back into the feature branch and deleted when the batch completes. A `_par/*` branch never opens a PR, so one-branch-per-feature still holds for anything a reviewer sees.
- Use a worktree when the checkout is dirty, work is parallel, or switching would need a stash. Never nest worktrees.

## Concurrency Safety

The loop runs items **sequentially by default**: one agent at a time, each starting from the previous item's committed state. This is the safe mode where no two agents touch the working tree at once. It holds across types: a bug fix and a feature item that touch the same file must serialize just as two features would.

Only parallelize items that are provably independent. Before running two items concurrently, both must hold:

- **No relationship:** neither `blocks`, `blocked_by`, nor `related` links them in the tracker.
- **Disjoint Implementation Surface:** their declared files or modules do not overlap. If two items list the same file, they share state; serialize them.

Parallel items run in **separate worktrees**, never the same one. When in doubt, serialize: a shared file edited by two agents at once corrupts the work.

### Running a parallel batch

When two or more unblocked items are provably independent, run them as one batch:

1. Cut a `_par/<item-slug>` branch from the current feature HEAD for each item, each in its own worktree. Never reuse or nest worktrees.
2. Spawn one agent per worktree in the background (implement-item, or the item's typed agent), passing only the context that item references.
3. As each agent returns, confirm its own gate passed, then merge its `_par/<slug>` branch into the feature branch. Disjoint surfaces make the merge clean; a merge conflict means the surfaces were not actually disjoint, so treat it as a planning defect, abort the batch, and serialize those items.
4. After the whole batch is merged, **re-run the feature's verification on the integrated branch**. Disjoint files can still interact, and this pass is the only thing that catches it. If it fails, bisect to the offending item, record the integration dead end as a comment on that item, file a `fix`, and do not proceed until the integrated branch is green.
5. Delete the `_par/*` branches and their worktrees.

A batch runs several agents at once and adds merge and re-verify overhead, so batch only when the items are genuinely independent and worth it (roughly three or more). When in doubt, serialize.

## Execution

1. Select work: the next open, unblocked item by tracker Status, Priority, and relationships (prefer `Ready`, skip anything blocked). If several unblocked items are provably independent, select them as a parallel batch instead.
2. Check `git status --short` and switch to the linked branch or worktree before delegating.
3. Dispatch:
   - **Single item:** invoke the matching agent by type (see Dispatch) with the item spec and only the context it references.
   - **Parallel batch:** run it per "Running a parallel batch".
4. Handle each agent's return:
   - **Completed:** mark the item done or closed in the tracker, record the commit and verification evidence, and update any blockers or relationships. File any incidental findings the agent reported as new typed items. In a batch, do this per item as each merges, then run the integration re-verify before moving on.
   - **Stopped for a structural decision:** resolve the structure with the user, then re-invoke the agent with the decision.
   - **Stopped for a blocking defect** (during a feature or refactor item): record the failed approach as a comment on the item (what was tried, why it failed) so a re-attempt does not repeat it, then file a `fix` item and route it to the debug agent; once fixed, re-invoke the original item.
5. Move to the next unblocked item or batch.

## Done When

Every approved item is executed, verified, committed, and updated in the tracker. When a branch's work is committed (a feature's items, or a standalone fix, perf, or refactor), use the **pull-request** skill.
