---
name: srs
description: "Use after brainstorming is approved: formalize what the system must do into a versioned requirements specification before architecture design begins."
---

# SRS (Software Requirements Specification)

Use after the brainstorming design is approved. Goal: translate the approved design into a versioned requirements specification — what the system must do, for whom, under which constraints. The SRS defines the *what*. Architecture design defines the *how*.

A single `docs/srs.md` covers the entire product, organized by domain. When adding a new feature, append new RF-XXX domain sections — do not create separate files.

## Conventions

- **IDs:** Functional requirements use `RF-XXX.N` (2–4 letter domain code + sequence). Non-functional use `RNF-XXX.N`. Never renumber or delete — deprecated requirements get `~~strikethrough~~` and a note.
- **Priority (MoSCoW):** Must Have / Should Have / Could Have / Won't Have. Cap Must Have at ~60%.
- **Status:** `Draft` → `Accepted` → `Deprecated`.
- **Linking:** Always reference requirements with a markdown link, never plain text: `[RF-ANC.1](#rf-anc1)`.
- **Verifiability:** If a QA engineer cannot write a test without asking a follow-up question, the requirement is not done. No vague language ("easy", "fast", "reasonable") — use measurable criteria.
- **Sequencing:** MoSCoW priority reflects business value, not implementation order. Do not assign or suggest roadmap phases — that belongs in the backlog or `docs/roadmap.md`.

## Process

1. Read `docs/product/vision-and-strategy.md` if it exists. Extract Principles and Anti-goals; any requirement that contradicts them must be flagged and justified before it can proceed.
2. Check if `docs/srs.md` exists.
   - **Does not exist:** create it from scratch using `docs/product/vision-and-strategy.md` and `docs/product/discovery.md` as input when available. If prior docs are missing, state which inputs are missing and what assumptions fill the gap.
   - **Exists:** read the existing document, identify the new domains affected by the current feature, and append the new RF-XXX sections. Do not rewrite or reorganize existing requirements.
3. Identify actors, use cases, constraints, non-goals, and decisions already made.
4. Group functional requirements into domains (RF-XXX). Non-functional in a separate section (RNF-XXX).
5. Write each requirement: observable system behavior, not implementation. One rule per bullet. Edge cases and limits inline.
6. Save `docs/srs.md`.

## Template (initial creation)

```markdown
# SRS — [Product Name]

> Vision and strategy: [docs/product/vision-and-strategy.md](./product/vision-and-strategy.md)
> Product context: [docs/product/discovery.md](./product/discovery.md)

## Context
2–4 sentences: the product's purpose and the core design direction.
Updated when the product direction changes — never deleted.

# 1. Functional Requirements

## RF-XXX: [Domain Name]

### RF-XXX.1: [Requirement name]
**Priority:** Must Have | **Status:** Accepted | **Dependencies:** —
* Concrete, verifiable behavior. One rule per bullet.
* Edge cases and limits go here.

# 2. Non-Functional Requirements

## RNF-XXX: [Category]

### RNF-XXX.1: [Requirement name]
**Priority:** Must Have | **Status:** Accepted | **Dependencies:** —
* Measurable target (e.g. "< 100ms p95", "≥ WCAG 2.1 AA").

# 3. Glossary
Terms with non-obvious domain meaning or that have multiple interpretations in the codebase. One line per term: `**Term** — definition`.

# 4. References
Links to related ADRs, discovery doc, vision/strategy doc, or external specs that informed requirements. One line per link.
```

## Done When

Document saved and approved. Suggest **architecture-design** to define how the requirements will be implemented.
