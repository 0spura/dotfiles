---
name: architecture-design
description: Design the smallest implementation structure for accepted requirements. Use before coding when a change introduces a real module, data, integration, or failure-boundary decision.
---

# Architecture Design

The SRS owns observable behavior; this skill owns its technical realization. Create `docs/project.md` only when the repository needs it.

Design the smallest deep modules: clear ownership, narrow interfaces, and a seam callers and tests can cross. Read `skill://architecture-design/reference/deep-modules.md` when choosing a seam, and add an abstraction only when it hides real complexity or a second concrete variation justifies it. Resolve a costly choice with the user or `grill-me` before documenting it.

For each changed seam, specify only its owner, contract, invariants, integration failure behavior, and trust boundary. For a collection path, state cardinality, query or remote-call shape, pagination or batching, and the evidence that prevents N+1.

Update `docs/architecture.md` (`skill://architecture-design/reference/template.md`) and `docs/project.md` only when applicable, referencing `srs` and `adr` records instead of repeating them.

## Review

Every seam has an owner, every integration has a failure path, every collection has bounded I/O, and the design is testable publicly.

## Size and structure

Keep one `docs/architecture.md` while it stays scannable, roughly 500 lines and 6 top-level sections; beyond that it becomes an index and each concern moves to `docs/architecture/<concern>.md`.

## Output

The architecture artifact and the unresolved choices.
