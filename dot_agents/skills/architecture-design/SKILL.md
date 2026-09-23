---
name: architecture-design
description: Design the smallest implementation structure for accepted requirements. Use before coding when a change introduces a real module, data, integration, or failure-boundary decision.
---

# Architecture Design

The SRS owns observable behavior; this skill owns its technical realization. Create `docs/project.md` only when the repository needs it.

Design the smallest deep modules: clear ownership, narrow interfaces, and a seam callers and tests can cross. Design for safe evolution: preserve the public contract while internals change, separate a stable interface from volatile behavior, and prefer rollout strategies that expose a change gradually with observable health and a fast rollback path when risk justifies it. Read `skill://architecture-design/reference/deep-modules.md` when choosing a seam, and add an abstraction only when it hides real complexity or a second concrete variation justifies it. Resolve a costly choice with the user or `grill-me` before documenting it.

For each changed seam, specify only its owner, contract, invariants, integration failure behavior, and trust boundary. For a collection path, state cardinality and the pagination, batching, or query bound that keeps database and remote I/O bounded.

## File and folder layout

Place code by reason to change, not by size: group responsibilities that change together behind a cohesive module, and split when independent policies change for different reasons. A domain prefix repeated across separate files can signal a missing boundary, but a folder or another level of nesting must make ownership clearer, not merely move names. Read `skill://architecture-design/reference/module-layout.md` for placement examples and `skill://architecture-design/reference/deep-modules.md` before splitting a module.

Update `docs/architecture.md` (`skill://architecture-design/reference/template.md`) and `docs/project.md` only when applicable, referencing `srs` and `adr` records instead of repeating them.

## Review

Every seam has an owner, every integration has a failure path, every collection has bounded I/O, and the design is testable publicly.

## Size and structure

Keep `docs/architecture.md` scannable; when distinct concerns make it hard to navigate, use it as an index and move those concerns to `docs/architecture/<concern>.md`.

## Output

The architecture artifact and the unresolved choices.
