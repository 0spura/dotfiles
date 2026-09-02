---
name: implementation-plan
description: "Convert approved requirements and architecture into typed, dependency-aware issues with an explicit implementation surface and verification command."
---

# Implementation Plan

Plan only; do not write source code. Convert the approved SDD contract into the smallest independently verifiable issues. Use native issue fields before labels.

## Workflow

1. Reuse an existing item before creating a duplicate; select from summaries before reading full bodies.
2. Classify each item as `feat`, `fix`, `refactor`, or `perf`; load only its matching template from `reference/`.
3. Create vertical slices. Each item records goal, type, priority, dependencies, **Implementation Surface**, acceptance criteria, independent oracle, verification command, and completion gate.
4. Model blockers and overlapping surfaces as relationships so the execution loop serializes them.
5. For wide refactors, use expand → migrate in batches → contract; keep every stage green.

Link settled requirements and decisions rather than restating them. Return items, relationships, and the next unblocked item.

Stop when an issue cannot be read, a dependency is unresolved, or the implementation surface cannot be bounded. Return the missing decision instead of creating vague work.
