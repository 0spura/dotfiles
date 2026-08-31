---
name: implementation-plan
description: "Convert approved requirements and architecture into typed, dependency-aware tracker work items with an explicit implementation surface and verification command."
---

# Implementation Plan

Plan only; do not write source code. Use the configured tracker MCP and native fields before labels.

## Workflow

1. Reuse an existing item before creating a duplicate.
2. Classify each item as `feat`, `fix`, `refactor`, or `perf`; load only its matching template from `reference/`.
3. Create vertical, independently verifiable slices. Every item includes goal, type, priority, dependencies, **Implementation Surface**, verification command, and completion gate.
4. Model blockers and overlapping surfaces as relationships so the execution loop serializes them.
5. For wide refactors, use expand → migrate in batches → contract; keep every stage green.

Link settled requirement IDs and memory decisions rather than restating them. Return the created items, relationships, and next unblocked item.

Stop when the tracker is unavailable, a dependency is unresolved, or the implementation surface cannot be bounded. Return the missing decision instead of creating vague work.
