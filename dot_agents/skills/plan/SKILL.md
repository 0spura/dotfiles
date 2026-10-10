---
name: plan
description: Decide the smallest useful plan for a tracker item, routing missing discovery, design, or requirements before delivery items exist. Use before non-trivial implementation.
---

# Plan

Use `workctl`; providers come from repository configuration. Read the selected command's `--help` before use. The parent owns tracker writes.

## Tracker reads

Run `workctl issue list`, then `workctl issue view 123` for the chosen contract; never plan from a summary alone. Read linked artifacts once. The parent reads back every write. GitHub uses `issue edit|comment`; GitLab uses `issue update|note`.

## Workflow

1. Classify the item as `feat`, `fix`, `refactor`, or `perf`, and load only its matching template under `skill://plan/reference/` — `feature.md`, `bug.md`, `refactor.md`, or `perf.md`.
2. Name what is missing before delivery — discovery, product direction, user-flow design, requirements, architecture, or a costly unresolved choice — and route to `product-discovery`, `brainstorming`, `design-principles`, `srs`, `architecture-design`, or `grill-me` as appropriate instead of planning around the gap.
3. Slice vertically: goal, implementation surface (see Placement), acceptance, independent oracle, verification, completion gate.
4. Model only real blockers and overlapping write surfaces. For a wide refactor, expand, migrate in green batches, then contract.
5. Keep each slice releasable on its own: independent, testable, and deployable or verifiable without waiting for the remaining slices. A slice is not complete until its verification ran and its feedback source was named.
6. Link settled requirements and decisions rather than restating them.

## Placement

Name concrete paths when placement or write ownership is known. A reported bug may start with a suspected boundary and a diagnostic seam; resolve its paths after diagnosis rather than guessing them. Place known files by reason to change rather than size, using `skill://architecture-design/reference/module-layout.md` inside an existing boundary. Route a new or moved boundary through step 2, and name the landing paths before assigning implementation.

## Done when

The plan names its slices, their order, their acceptance evidence, and the next unblocked item.

## Stop conditions

Stop when the item cannot be read, a dependency is unresolved, the tracker is unavailable, or the implementation surface cannot be bounded, and return the missing decision.
