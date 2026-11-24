---
name: plan
description: Plan work around an outcome, boundaries, blockers, vertical slices, and verification. Use a workctl issue only when tracking is explicitly requested or required; otherwise keep the plan in-session.
---

# Plan

Turn an approved goal into ordered, independently verifiable vertical slices with explicit boundaries and real blockers.

Read `skill://plan/reference/workctl.md` **only** when tracking applies. Use the matching type guide when helpful: `feature.md`, `bug.md`, `refactor.md`, or `perf.md` under `skill://plan/reference/`.

## House rules

1. **One contract, not ticket sprawl.** Never create a tracker item just because work is non-trivial, and never open separate tickets for planning, design, or review phases.
2. **Vertical slices only.** Every slice delivers an observable outcome with its own acceptance oracle, owned paths, and verification command.
3. **Real blockers only.** Inspect actual code/dependency blockers; never guess unknown file placement — investigate it first.
4. **Serialize overlapping writers.** Only slices with disjoint write surfaces may run in parallel.
5. **A plan is not approval to build.** Stop and present the plan unless execution was already approved.

## Tracked vs. untracked

| Mode | Contract source | Tracker actions |
| --- | --- | --- |
| **Tracked** (user supplied issue or repo policy requires it) | Canonical `workctl` issue + linked artifacts | Read issue once; record agreed plan on same issue and read back; create child items only for independently accepted deliverables. |
| **Untracked** (default) | Approved user request + repo instructions | Skip `workctl` completely; keep plan and checklist in-session. |

## Workflow

1. **Establish the contract & reuse inventory.** Determine tracked vs. untracked. Capture goal, acceptance, non-goals, blockers, and verification. Before slicing any multi-file or cross-cutting work, inventory existing workspace crates, sibling internal SDKs, native framework primitives, and installed dependencies (via `scout` if needed) so slices reuse or extend them instead of inventing duplicates.
2. **Close upstream gaps.** Route missing discovery (`product-discovery`), undecided direction (`brainstorming`), UX flow (`design-principles`), requirements (`srs`), architecture (`architecture-design`), or costly choices (`grill-me`) before slicing.
3. **Slice vertically.** For each slice specify:
   - Observable outcome
   - Owned paths (investigated, not guessed)
   - Acceptance oracle & verification command
   - Dependencies / blockers
4. **Order execution.** Sequence true dependencies and serialize any overlapping write surfaces.
5. **Record and hand off.** Persist on the canonical issue (only when tracked, then read back) or present in-session. Hand the next unblocked slice to `implementation` once approved.

## Checklist

- [ ] Goal, non-goals, actual blockers, and verification are explicit.
- [ ] Every slice is vertically testable on its own with known landing paths.
- [ ] Overlapping writers are serialized.
- [ ] No unnecessary `workctl` items created.

## Never

- Create a tracker item solely because a task is multi-step or non-trivial.
- Slice horizontally ("DB layer", "API layer", "tests later") with no per-slice verification.
- Guess file paths or module ownership without checking the repository.
- Treat saving a plan as permission to start implementing.

## Output

Outcome, boundaries/non-goals, blockers, ordered vertical slices (with owned paths and verification), and next action.
