---
name: architecture-design
description: "Use after SRS is approved: define how requirements will be implemented — service boundaries, APIs, data model, integrations, failure modes, and technical contracts before coding."
---

# Architecture Design

Use after the SRS is approved. Goal: a clear technical contract that answers *how* something will be implemented. Only the decisions that aren't obvious from the code.

The SRS defines the *what*. This skill defines the *how*. Do not rewrite or expand requirements here — reference them by RF-XXX.N ID. If a requirement is unclear, go back to the SRS before designing.

A single `docs/architecture.md` covers the entire product. When adding a new feature, update the relevant sections — merge new content into the existing structure, do not append feature-named sections.

## Constraints

- No implementation until the architecture is approved.
- Prefer the simplest design that satisfies the stated requirements.
- Challenge new services, abstractions, queues, and event buses unless they solve a concrete problem in a requirement.
- Check what is already documented before writing any section — if a decision is in `project.md`, `vision-and-strategy.md`, or an ADR, reference it, do not repeat it.
- If a requirement is unclear, go back to the SRS before designing.

## Process

1. Check if `docs/architecture.md` exists.
   - **Does not exist:** if `docs/project.md` does not exist either, create it first — it covers stack, global constraints, repo structure, and environments. Then create `docs/architecture.md` from scratch using `docs/srs.md` and `docs/product/vision-and-strategy.md` as input.
   - **Exists:** read the existing document and existing ADRs. Identify which sections are affected by the current feature. Update those sections by merging new content — do not add feature-named sections.
2. List open decisions not yet settled that materially affect implementation. For non-trivial decisions, present options before drafting:

   | Option | Best for | Tradeoff | Risk |
   |---|---|---|---|
   | A | ... | ... | ... |

3. Extract business rules for the current work: calculations, validations, state transitions, limits. Format only when non-obvious:
   ```
   Rule: [name] | Source: [RF-XXX.N] | Given / When / Then: [behavior] | Parameters: [values]
   ```
4. Update or create the architecture document (see template below).
5. Self-critique before saving: Is this simpler than the obvious overbuilt version? Does every service boundary have a concrete reason? Can a dependency failure be traced end to end? Are business rules preserved? Are missing values represented explicitly — never silently defaulted?
6. Save. Identify decisions costly to reverse → use **adr** for each one.

## Template (initial creation)

```markdown
# Architecture — [Product Name]

> Stack: [docs/project.md](./project.md)
> Vision and strategy: [docs/product/vision-and-strategy.md](./product/vision-and-strategy.md)
> SRS: [docs/srs.md](./srs.md)

## Data Model
Entities, relationships, and key fields. Enough to implement without ambiguity. Not a full ERD.

## Business Rules
Non-obvious rules the implementation must preserve, traced to SRS requirement IDs.
Organized by domain — updated as features land.

## Integration Patterns
Protocols, sync strategy, conflict resolution, retry policy, failure handling.
Do not document field-level API contracts — those live in code.

## Security Model
Auth mechanism, permission model, trust boundaries, data sensitivity classification.

## Deployment
Where each component runs, how it scales, CI/CD flow per component.

## Failure Modes
What fails, how it fails, user impact, system behavior, recovery path.
```

## Done When

Document saved and approved. Suggest **grill-me** to pressure-test before implementation.
