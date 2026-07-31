---
name: srs
description: Formalize an approved design into a versioned requirements specification — what the system must do, for whom, under which constraints — before architecture.
whenToUse: Use after brainstorming produces an approved design and before architecture-design begins.
---

# SRS (Software Requirements Specification)

The SRS defines the *what*; architecture defines the *how*. Translate the approved brainstorming design into versioned, verifiable requirements.

A single `docs/srs.md` covers the product, organized by domain, appending new RF-XXX domain sections per feature. Past the split threshold (~500 lines or 6 top-level sections), keep `docs/srs.md` as an index and split domains into `docs/requirements/<domain>.md`.

## Scope boundary

State observable system behavior only. Each requirement earns its place here by not belonging elsewhere:

- Screens, navigation, gestures, visual states, and flow between screens → `docs/design/`.
- How it is built (data model, APIs, protocols, sync, retries) → `docs/architecture.md`.
- A costly-to-reverse decision and its alternatives → `docs/adr/`.

## Conventions

- **IDs:** functional `RF-XXX.N` (a 2 to 4 letter domain code plus sequence), non-functional `RNF-XXX.N`. IDs are permanent; a deprecated requirement keeps its number and gains `~~strikethrough~~` with a note.
- **Priority (MoSCoW):** Must, Should, Could, Won't Have. Cap Must Have near 60%. Priority is business value, not delivery order; phases live in the tracker backlog.
- **Status:** `Draft` → `Accepted` → `Deprecated`.
- **Linking:** reference a requirement as a markdown link, never plain text: `[RF-ANC.1](#rf-anc1)`.
- **Verifiability:** a QA engineer writes a test from the requirement without a follow-up question. Use measurable criteria, not "easy", "fast", or "reasonable".

## Process

1. Read `docs/product/vision.md` if present; its Principles and Anti-goals are hard filters. A requirement that contradicts one is a blocking issue, so resolve it with the user before writing.
2. On a fresh `docs/srs.md`, read `docs/product/discovery.md` if present, else proceed from the approved design and name the missing inputs and assumptions. On an existing one, read it, then append the new feature's RF-XXX sections and leave existing requirements as they are.
3. Identify actors, use cases, constraints, non-goals, and decisions already made.
4. Group functional requirements into domains (RF-XXX); keep non-functional ones in their own RNF-XXX section.
5. Write each requirement as one observable behavior per bullet, edge cases and limits inline, checked against the Scope boundary.
6. For the initial document, read `reference/template.md`. Save `docs/srs.md`.

## Done When

Saved and approved. Suggest **architecture-design** for the *how*, and the **ux-design agent** in parallel when the UI is significant.
