---
name: architecture-design
description: "Use after SRS is approved: define how requirements will be implemented — service boundaries, APIs, data model, integrations, failure modes, and technical contracts before coding."
allowed-tools: Read, Grep, Glob, Write, Edit
---

# Architecture Design

Use after the SRS is approved. Goal: a clear technical contract that answers *how* something will be implemented.

The SRS defines the *what*. This skill defines the *how*. Architecture documents decisions and constraints — not behavior. If you find yourself describing what the system does rather than how it works, you are writing SRS content; reference the requirement ID instead of repeating it. UI flows and navigation are not architecture — they live in `docs/design/`. If a requirement is unclear, go back to the SRS before designing.

A single `docs/architecture.md` covers the entire product. When adding a new feature, update the relevant sections — merge new content into the existing structure, do not append feature-named sections. Once the file stops being easy to scan, keep it as an index and split concerns into `docs/architecture/<concern>.md`.

## Constraints

- No implementation until the architecture is approved.
- Prefer the simplest design that satisfies the stated requirements.
- Challenge new services, abstractions, queues, and event buses unless they solve a concrete problem in a requirement.
- Reference, never repeat: if a decision is already in `project.md`, `vision.md`, or an ADR, one line pointing there is enough.

## Process

1. Check if `docs/architecture.md` exists.
   - **Does not exist:** if `docs/project.md` does not exist either, create it first — it covers stack, global constraints, repo structure, and environments. Then create `docs/architecture.md` from scratch using `docs/srs.md` as input. Read `docs/product/vision.md` first — Principles are hard constraints that every architectural decision must respect.
   - **Exists:** read the existing document and existing ADRs. Identify which sections are affected by the current feature. Update those sections by merging new content — do not add feature-named sections.
2. List open decisions not yet settled that materially affect implementation. For non-trivial decisions, present options before drafting:

   | Option | Best for | Tradeoff | Risk |
   |---|---|---|---|
   | A | ... | ... | ... |

3. Extract business rules for the current work: calculations, validations, state transitions, limits. Format only when non-obvious:
   ```
   Rule: [name] | Source: [RF-XXX.N] | Given / When / Then: [behavior] | Parameters: [values]
   ```
4. Update or create the architecture document. For initial creation, read `reference/template.md`.
5. Self-critique before saving: Is this simpler than the obvious overbuilt version? Does every service boundary have a concrete reason? Can a dependency failure be traced end to end? Are business rules preserved? Are missing values represented explicitly — never silently defaulted?
6. Save. Identify decisions costly to reverse → use **adr** for each one.

## Done When

Document saved and approved. Suggest **grill-me** to pressure-test before implementation.
