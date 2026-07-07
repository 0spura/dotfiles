---
name: srs
description: "Use after brainstorming is approved: formalize what the system must do into a versioned requirements specification before architecture design begins."
allowed-tools: Read, Grep, Glob, Write, Edit
---

# SRS (Software Requirements Specification)

Use after the brainstorming design is approved. The goal is to translate the approved design into a versioned requirements specification: what the system must do, for whom, and under which constraints. The SRS defines the *what*. Architecture design defines the *how*.

A single `docs/srs.md` covers the entire product, organized by domain. When adding a new feature, append new RF-XXX domain sections rather than creating separate files. Once the file stops being easy to scan, keep `docs/srs.md` as an index and split domains into `docs/requirements/<domain>.md`.

## Scope boundary

The SRS states observable system behavior only. Before writing any requirement, check that it does not belong elsewhere:

- Screens, navigation, gestures, visual states, and flow between screens go to `docs/design/`.
- How it is built (data model, APIs, protocols, sync, retries) goes to `docs/architecture.md`.
- A costly-to-reverse decision and its alternatives go to `docs/adr/`.

If you are describing what the user sees or taps, stop: that is design, not a requirement. When unsure whether content is a requirement or belongs in design or architecture, read `reference/boundaries.md`.

## Conventions

- **IDs:** Functional requirements use `RF-XXX.N` (a 2 to 4 letter domain code plus sequence). Non-functional use `RNF-XXX.N`. Never renumber or delete; deprecated requirements get `~~strikethrough~~` and a note.
- **Priority (MoSCoW):** Must Have, Should Have, Could Have, Won't Have. Cap Must Have at about 60%.
- **Status:** `Draft`, then `Accepted`, then `Deprecated`.
- **Linking:** Always reference requirements with a markdown link, never plain text: `[RF-ANC.1](#rf-anc1)`.
- **Verifiability:** If a QA engineer cannot write a test without asking a follow-up question, the requirement is not done. Avoid vague language ("easy", "fast", "reasonable") and use measurable criteria.
- **Sequencing:** MoSCoW priority reflects business value, not implementation order. Do not assign or suggest delivery phases; that belongs in the tracker backlog.

## Process

1. Read `docs/product/vision.md` if it exists and extract the Principles and Anti-goals, which are hard filters. Any requirement that contradicts a principle is a blocking issue: flag it and resolve with the user before writing it. Do not silently soften a principle to fit a requirement.
2. Check whether `docs/srs.md` exists.
   - **Does not exist:** read `docs/product/discovery.md` if it exists. If no prior docs exist, proceed from the approved brainstorming design and state explicitly which inputs are missing and what assumptions fill the gap.
   - **Exists:** read the existing document, identify the new domains affected by the current feature, and append the new RF-XXX sections. Do not rewrite or reorganize existing requirements.
3. Identify actors, use cases, constraints, non-goals, and decisions already made.
4. Group functional requirements into domains (RF-XXX). Keep non-functional ones in a separate section (RNF-XXX).
5. Write each requirement as observable system behavior, not implementation. One rule per bullet, with edge cases and limits inline. Apply the Scope boundary above to every requirement.
6. To create the initial document, read `reference/template.md`. Save `docs/srs.md`.

## Done When

Document saved and approved. Suggest **architecture-design** to define how the requirements will be implemented. For products with significant UI, also suggest the **ui-design agent** to define interface structure and flows in parallel.
