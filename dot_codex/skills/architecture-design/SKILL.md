---
name: architecture-design
description: "Design how accepted requirements will be implemented: module boundaries, data ownership, integrations, technical contracts, security, and failure behavior before coding."
---

# Architecture Design

The SRS owns observable behavior; this skill owns its technical realization. Read the accepted requirements, existing architecture, code, and relevant memory decisions. Create `docs/project.md` on first use when it is missing.

Design the smallest deep modules: narrow interfaces, high leverage, clear ownership, and a seam that callers and tests can cross. Read [reference/deep-modules.md](reference/deep-modules.md) when choosing a seam. Do not add an abstraction unless it hides real complexity or a second adapter/variation justifies it.

Before documenting, resolve costly choices with the user or `grill-me`; never silently choose a missing product, security, or contract decision. For each changed seam, specify only what implementation needs to know: data ownership, interfaces, dependencies, business-rule invariants, integration failure behavior, trust-boundary validation/authorization, and deployment constraints.

Update `docs/architecture.md` and `docs/project.md` only when applicable. Reference the SRS and memory decisions instead of repeating them. Record costly-to-reverse decisions with `adr` after approval.

Review the result: every seam has an owner, every integration has a failure path, every trust boundary is explicit, and the design can be tested at its public seam.

## Size and structure check

Keep one `docs/architecture.md` while it remains scannable (approximately 500 lines and 6 top-level sections). Otherwise keep it as an index and split concerns into `docs/architecture/<concern>.md`, preserving active links and ownership.
