---
name: architecture-design
description: "Define how approved requirements will be implemented (service boundaries, APIs, data model, integrations, failure modes, technical contracts) before coding."
allowed-tools: Read, Grep, Glob, Write, Edit
model: opus
effort: high
---

# Architecture Design

The SRS defines the *what*; this defines the *how*. Produce a technical contract of decisions and constraints, not behavior. Describing what the system does means writing SRS content, so reference the requirement ID instead. UI flows live in `docs/design/`; an unclear requirement goes back to the SRS before design.

A single `docs/architecture.md` covers the product, merging each feature into the sections it affects rather than appending feature-named ones. Past the split threshold (engineering-defaults.md), keep it as an index and split concerns into `docs/architecture/<concern>.md`.

## The bar

- The simplest design that satisfies the requirements. A new service, abstraction, queue, or event bus earns its place by solving a concrete requirement.
- Place each module boundary to hide the most behind the least; `reference/deep-modules.md` carries the vocabulary for making a module deep.
- Reference, never repeat: a decision already in `project.md`, `vision.md`, or an ADR gets one line pointing there.
- Design settles before implementation starts.

## Process

1. On a fresh `docs/architecture.md`: create `docs/project.md` first if absent (stack, global constraints, repo structure, environments), then build from `docs/srs.md`, with `docs/product/vision.md` Principles as hard constraints. On an existing one: read it and the ADRs, then merge the current feature into the sections it affects.
2. List open decisions that materially affect implementation. For each non-trivial one, present options before drafting:

   | Option | Best for | Tradeoff | Risk |
   |---|---|---|---|
   | A | ... | ... | ... |

3. Extract the business rules for this work (calculations, validations, state transitions, limits), formatting the non-obvious ones:
   ```
   Rule: [name] | Source: [RF-XXX.N] | Given / When / Then: [behavior] | Parameters: [values]
   ```
4. Update or create the document; for initial creation, read `reference/template.md`.
5. Self-critique before saving: simpler than the overbuilt version? Every boundary justified? A dependency failure traceable end to end? Business rules preserved? Missing values explicit rather than silently defaulted?
6. Save. Use **adr** for each decision costly to reverse.

## Done When

Saved and approved. Suggest **grill-me** to pressure-test before implementation.
