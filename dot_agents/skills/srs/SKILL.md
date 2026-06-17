---
name: srs
description: "Use after brainstorming is approved: formalize what the system must do into a versioned requirements specification before architecture design begins."
---

# SRS (Software Requirements Specification)

**When to use:** Brainstorming approved, ready to formalize requirements. Trigger: "write the SRS", "formalize requirements", "before architecture", "document what we're building".

**Goal:** A versioned document defining what the system must do — not how. Requirements that embed implementation choices are premature decisions, not requirements.

**Constraints:**
- IDs: `RF-XXX.N` for functional, `RNF-XXX.N` for non-functional. Never renumber or delete.
- Priority: Must Have / Should Have / Could Have / Won't Have. Cap Must Have at ~60%.
- Status: Draft → Accepted → Deprecated.
- Always link requirements with markdown: `[RF-ANC.1](#rf-anc1-anchor-creation)`, never plain text.
- Every requirement must be testable without asking a follow-up question.

**Process:**
1. Read `docs/product/discovery.md` for product context — do not repeat it in the SRS. Start directly at requirements.
2. Take brainstorming output as input. Identify actors, use cases, constraints, non-goals.
3. Group functional requirements by domain (RF-XXX). Non-functional in separate section (RNF-XXX).
4. Write each requirement: observable behavior, concrete, priority + status + dependencies declared.
5. Save to `docs/srs.md` (full product) or `docs/srs/feature-name.md` (scoped feature). Link to discovery doc at the top: `> Context: [docs/product/discovery.md](../product/discovery.md)`

**Done when:** SRS saved and approved. Suggest **architecture-design** to define how requirements will be implemented.
