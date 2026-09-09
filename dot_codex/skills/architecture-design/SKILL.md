---
name: architecture-design
description: Design the smallest implementation structure for accepted requirements. Use before coding when a change introduces a real module, data, integration, or failure-boundary decision.
---

# Architecture Design

The SRS owns observable behavior; this skill owns its technical realization.
Read the active issue, changed flow, existing architecture, and relevant
decisions. Create separate architecture work only when it blocks delivery or
needs its own approval. Create `docs/project.md` only when the repository needs
it.

Design the smallest deep modules: clear ownership, narrow interfaces, and a
seam callers and tests can cross. Read [reference/deep-modules.md](reference/deep-modules.md)
when choosing a seam. Do not add an abstraction unless it hides real complexity
or a second concrete variation justifies it.

Before documenting, resolve costly choices with the user or `grill-me`. For each
changed seam, specify only its owner, contract, invariants, integration failure
behavior, and trust boundary. For collection paths, state cardinality, query or
remote-call shape, pagination/batching, and the evidence that prevents N+1.

Update `docs/architecture.md` and `docs/project.md` only when applicable. Reference the SRS and memory decisions instead of repeating them. Record costly-to-reverse decisions with `adr` after approval.

Review the result: every seam has an owner, every integration has a failure
path, every collection has bounded I/O, and the design can be tested publicly.
Return the architecture artifact and unresolved choices to the caller.

## Size and structure check

Keep one `docs/architecture.md` while it remains scannable (approximately 500 lines and 6 top-level sections). Otherwise keep it as an index and split concerns into `docs/architecture/<concern>.md`, preserving active links and ownership.
