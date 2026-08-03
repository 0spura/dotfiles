# Parallel Execution

The loop parallelizes only items proven independent: no tracker relationship, disjoint Implementation Surfaces. A batch earns its merge and re-verify overhead at roughly three or more such items; otherwise serialize.

Each parallel item runs on a short-lived `_par/<item-slug>` branch cut from the feature HEAD, in its own worktree, never reused or nested. A `_par/*` branch never opens a PR, so one-branch-per-feature still holds for anything a reviewer sees.

## Running a batch

1. Cut a `_par/<item-slug>` branch and worktree per item.
2. Spawn one agent per worktree in the background (implement-item, or the item's typed agent), passing only the context that item references.
3. As each agent returns, confirm its gate passed, then merge its `_par/<slug>` into the feature branch. A merge conflict means the surfaces were not disjoint, a planning defect: abort the batch and serialize those items.
4. After the whole batch merges, re-run the feature's verification on the integrated branch. Disjoint files can still interact, and this pass is the only thing that catches it. On failure, bisect to the offending item, record the integration dead end on it, file a `fix`, and hold until the integrated branch is green.
5. Delete the `_par/*` branches and worktrees.
