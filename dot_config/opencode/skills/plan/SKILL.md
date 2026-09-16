---
name: plan
description: Decide the smallest useful plan for an issue, then route missing discovery, design, or requirements before creating delivery items. Use before non-trivial implementation.
---

# Plan

Plan only; do not write source code. Read the active issue and determine what
is missing before delivery: discovery, design, requirements, architecture, or
only a delivery breakdown. Route to the matching skill and stop when a missing
decision prevents a useful plan. Do not invent requirements.

When behavior and acceptance are approved, the active issue is the delivery
planning contract. Use an outcome/epic only when it groups multiple
independently deliverable items; otherwise keep planning on the same issue.

## Workflow

1. Reuse an existing item before creating a duplicate.
2. Classify it as `feat`, `fix`, `refactor`, or `perf`; load only its matching
   reference template.
3. Create vertical slices with goal, implementation surface, acceptance,
   independent oracle, verification, and completion gate.
4. Model only real blockers and overlapping write surfaces.
5. For wide refactors, expand, migrate in green batches, then contract.

Link settled requirements and decisions rather than restating them. Create the
smallest typed child items only when they are independently deliverable or have
real dependencies; otherwise keep them as an acceptance checklist. Return the
plan, relationships, and next unblocked item to the caller.

Stop when an issue cannot be read, a dependency is unresolved, or the implementation surface cannot be bounded. Return the missing decision instead of creating vague work.
