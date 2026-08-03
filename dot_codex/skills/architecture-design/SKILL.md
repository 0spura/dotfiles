---
name: architecture-design
description: "Design how accepted requirements will be implemented: module boundaries, data ownership, integrations, technical contracts, security, and failure behavior before coding."
---

# Architecture Design

The SRS owns observable behavior; this skill owns its technical realization. Read the accepted requirements, product principles, existing architecture, and relevant ADRs. On first use, also create `docs/project.md` when it is missing.

## Workflow

1. Surface costly or unresolved choices. Present viable options and obtain approval before settling them.
2. Define the simplest module boundaries that hide implementation complexity. Read [reference/deep-modules.md](reference/deep-modules.md) when choosing a boundary.
3. Record data ownership, non-obvious business-rule preservation, integration failures, security trust boundaries, and deployment concerns needed to implement safely.
4. Merge the feature into `docs/architecture.md`; split it only when the index is no longer scannable. For an initial document, use [reference/template.md](reference/template.md).
5. Create or supersede ADRs for costly-to-reverse choices.

6. Self-review the design: every boundary has an owner, every integration has failure behavior, every trust boundary has validation and authorization, and every missing value is explicit.

Reference requirements instead of repeating them. Save only after decisions are approved. Return open decisions rather than silently choosing them.

## Output

Update `docs/architecture.md`, `docs/project.md`, and ADRs only when applicable. Include data ownership, interfaces, dependencies, failure behavior, security constraints, deployment concerns, and requirement traceability.

## Size and structure check

Keep one `docs/architecture.md` while it remains at or below approximately 500 lines and 6 top-level sections. When either threshold is exceeded, keep it as a scannable index and split concerns into `docs/architecture/<concern>.md`. Preserve links, ownership, and requirement traceability across the split.
