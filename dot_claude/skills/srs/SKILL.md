---
name: srs
description: "Use after brainstorming is approved: formalize what the system must do into a versioned requirements specification before architecture design begins."
allowed-tools: Read, Grep, Glob, Write, Edit
---

# SRS (Software Requirements Specification)

Use after the brainstorming design is approved. Goal: translate the approved design into a versioned requirements specification — what the system must do, for whom, under which constraints. The SRS defines the *what*. Architecture design defines the *how*.

A single `docs/srs.md` covers the entire product, organized by domain. When adding a new feature, append new RF-XXX domain sections — do not create separate files. Once the file stops being easy to scan, keep `docs/srs.md` as an index and split domains into `docs/requirements/<domain>.md`.

## Scope boundary

The SRS states observable system behavior only. Before writing any requirement, check it does not belong elsewhere:

- Screens, navigation, gestures, visual states, flow between screens → `docs/design/`
- How it is built — data model, APIs, protocols, sync, retries → `docs/architecture.md`
- A costly-to-reverse decision and its alternatives → `docs/adr/`

If you are describing what the user sees or taps, stop — that is design, not a requirement. When the SRS spans multiple domains or you are unsure where content belongs, read `reference/boundaries.md`.

## Conventions

- **IDs:** Functional requirements use `RF-XXX.N` (2–4 letter domain code + sequence). Non-functional use `RNF-XXX.N`. Never renumber or delete — deprecated requirements get `~~strikethrough~~` and a note.
- **Priority (MoSCoW):** Must Have / Should Have / Could Have / Won't Have. Cap Must Have at ~60%.
- **Status:** `Draft` → `Accepted` → `Deprecated`.
- **Linking:** Always reference requirements with a markdown link, never plain text: `[RF-ANC.1](#rf-anc1)`.
- **Verifiability:** If a QA engineer cannot write a test without asking a follow-up question, the requirement is not done. No vague language ("easy", "fast", "reasonable") — use measurable criteria.
- **Sequencing:** MoSCoW priority reflects business value, not implementation order. Do not assign or suggest roadmap phases — that belongs in the backlog or `docs/roadmap.md`.

## Process

1. Read `docs/product/vision.md` if it exists. Extract the Principles and Anti-goals — these are hard filters. Any requirement that contradicts a principle is a blocking issue: flag it and resolve with the user before writing it. Do not silently soften a principle to fit a requirement.
2. Check if `docs/srs.md` exists.
   - **Does not exist:** read `docs/product/discovery.md` if it exists. If no prior docs exist, proceed from the approved brainstorming design — state explicitly which inputs are missing and what assumptions fill the gap.
   - **Exists:** read the existing document, identify the new domains affected by the current feature, and append the new RF-XXX sections. Do not rewrite or reorganize existing requirements.
3. Identify actors, use cases, constraints, non-goals, and decisions already made.
4. Group functional requirements into domains (RF-XXX). Non-functional in a separate section (RNF-XXX).
5. Write each requirement: observable system behavior, not implementation. One rule per bullet. Edge cases and limits inline. Apply the Scope boundary above to every requirement.
6. To create the initial document, read `reference/template.md`. Save `docs/srs.md`.

## Done When

Document saved and approved. Suggest **architecture-design** to define how the requirements will be implemented. For products with significant UI, also suggest **ui-design** to define interface structure and flows in parallel.
