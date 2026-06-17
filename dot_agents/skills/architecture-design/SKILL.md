---
name: architecture-design
description: "Use when designing software architecture: service boundaries, APIs, data model, integrations, failure modes, and technical contracts before coding."
---

# Architecture Design

**When to use:** Designing a new feature, integration, refactor, or modernization before coding. Trigger: "design this", "how should we architect", "before I implement", "how does this connect".

**Goal:** A clear technical contract that can be implemented without rediscovering decisions mid-PR.

**Constraints:**
- No implementation until the architecture is approved.
- Prefer the simplest design that satisfies the stated requirements.
- Challenge new services, abstractions, queues, event buses unless they solve a concrete problem.
- Separate business rules from implementation details before changing legacy code.

**Process:**
1. If `docs/project.md` does not exist, create it first: stack, languages, frameworks, infra, deployment model, global constraints (e.g. "all APIs are REST", "auth via JWT"). This is the foundation all features inherit.
2. Read `docs/project.md`, `docs/features/<feature-name>/srs-document.md`, and existing ADRs. Use RF-XXX.N IDs as anchors for decisions.
3. Inspect relevant code, schemas, routes, and existing patterns.
4. Extract business rules: calculations, validations, state transitions, eligibility, limits.
5. Compare 2-3 options for non-trivial decisions: what / when / tradeoff / risk / migration cost.
6. Produce the contract: boundaries, data model, integration patterns, security model, deployment, failure modes, open questions. Do not document field-level API contracts — those live in code.
7. Save to `docs/features/<feature-name>/architecture.md`.
8. On approval, use **adr** for decisions affecting system boundaries, data ownership, or public APIs.

**Done when:** Document saved. Suggest **grill-me** to pressure-test before implementation.
