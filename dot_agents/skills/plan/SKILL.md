---
name: plan
description: Decide the smallest useful plan for a tracker item, routing missing discovery, design, or requirements before delivery items exist. Use before non-trivial implementation.
---

# Plan

Planning only; no source code. Once behavior and acceptance are approved the item is the delivery contract, and discovery, design, requirements, and architecture stay sections or linked documents on it.

## Workflow

1. Classify the item as `feat`, `fix`, `refactor`, or `perf`, and load only its matching template under `skill://plan/reference/`.
2. Name what is missing before delivery — discovery, design, requirements, or architecture — and route to that skill instead of planning around the gap.
3. Slice vertically: goal, implementation surface, acceptance, independent oracle, verification, completion gate.
4. Model only real blockers and overlapping write surfaces. For a wide refactor, expand, migrate in green batches, then contract.
5. Link settled requirements and decisions rather than restating them.

## Done when

The plan names its slices, their order, their acceptance evidence, and the next unblocked item.

## Stop conditions

Stop when the item cannot be read, a dependency is unresolved, the tracker is unavailable, or the implementation surface cannot be bounded, and return the missing decision.
