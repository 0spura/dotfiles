---
name: srs
description: "Use after brainstorming is approved: formalize what the system must do into a versioned requirements specification before architecture design begins."
---

# SRS (Software Requirements Specification)

Use after the brainstorming design is approved. Goal: translate the approved design into a formal, versioned requirements specification — what the system must do, for whom, under which constraints — before any technical decisions are made.

The SRS defines the *what*. Architecture design defines the *how*. Requirements that embed implementation choices are not requirements — they are premature decisions.

## Conventions

**IDs:** Functional requirements use `RF-XXX.N` (2–4 letter domain code + sequence). Non-functional use `RNF-XXX.N`. Never renumber or delete — deprecated requirements get `~~strikethrough~~` and a note.

**Priority (MoSCoW):** Every requirement declares one of: Must Have / Should Have / Could Have / Won't Have. Cap Must Have at ~60% — if everything is critical, prioritization failed. Won't Have makes exclusions explicit and prevents scope creep.

**Status:** `Draft` → `Accepted` → `Deprecated`.

**Linking:** Always reference requirements with a markdown link, never plain text. The anchor is the heading slugified: `[RF-ANC.1](#rf-anc1-anchor-creation)`.

**Verifiability:** If a QA engineer cannot write a test without asking a follow-up question, the requirement is not done. No vague language ("easy", "fast", "reasonable") — replace with measurable criteria.

## Structure

The product context (vision, principles, target users, market) lives in `docs/product/discovery.md` — do not repeat it here. The SRS starts directly at requirements.

```markdown
# SRS — [Product / Feature Name]

> Product context: [docs/product/discovery.md](../../product/discovery.md)

# 1. Functional Requirements

## RF-XXX: [Domain Name]

### RF-XXX.1: [Requirement name]
**Priority:** Must Have | **Status:** Accepted | **Dependencies:** —
* Concrete, verifiable behavior. One rule per bullet.
* Edge cases and limits go here, not in a separate doc.

# 3. Non-Functional Requirements

## RNF-XXX: [Category]

### RNF-XXX.1: [Requirement name]
**Priority:** Must Have | **Status:** Accepted | **Dependencies:** —
* Measurable target (e.g. "< 100ms p95", "≥ WCAG 2.1 AA").

# 4. Glossary
# 5. References
```

## Process

### 1. Read The Approved Design

Read `docs/features/<feature-name>/design.md` as the primary input. This file contains the approved design from brainstorming — use it as the source of truth, not the conversational context. Identify: actors, use cases, constraints, non-goals, and any explicit decisions already made.

### 2. Organize By Domain

Group functional requirements into domains (RF-XXX). Non-functional requirements go in a separate section (RNF-XXX).

### 3. Write Requirements

Each requirement describes observable system behavior, not implementation. Declare priority, status, and dependencies for every requirement.

### 4. Save The Document

Save to `docs/features/<feature-name>/srs-document.md`. This file is versioned — changes tracked in git, deprecated requirements never deleted.

### 5. Hand Off

After the SRS is approved, suggest **architecture-design** to define how the requirements will be implemented.
