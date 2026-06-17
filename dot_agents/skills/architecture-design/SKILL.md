---
name: architecture-design
description: "Use when designing, critiquing, or modernizing software architecture: feature architecture, service boundaries, APIs, integrations, data flow, migrations, failure modes, business-rule extraction, and implementation contracts before coding."
---

# Architecture Design

**When to use:** Designing a new feature, integration, refactor, or modernization before coding. Trigger: "design this", "how should we architect", "before I implement", "how does this connect".

**Goal:** A clear technical contract that can be implemented without rediscovering decisions mid-PR.

**Constraints:**
- No implementation until the architecture is approved.
- Prefer the simplest design that satisfies the stated requirements.
- Challenge new services, abstractions, queues, event buses unless they solve a concrete problem.
- Separate business rules from implementation details before changing legacy code.

**Modes:**
- **Feature:** actors, domain boundaries, states/transitions, data model, rollout, observability
- **Integration:** ownership, communication pattern (REST/events/RPC), idempotency approach, auth, failure handling, rate limits — not field-level contracts (those live in code)
- **Modernization:** extract business rules first; identify what must not change before proposing new structure
- **Critique:** challenge complexity, validate domain boundaries, name missing NFRs, trace dependency failures

**Process:**
1. Read `docs/srs.md` and existing ADRs. Use RF-XXX.N IDs as anchors for decisions.
2. Inspect relevant code, schemas, routes, and existing patterns.
3. Extract business rules: calculations, validations, state transitions, eligibility, limits.
4. Compare 2-3 options for non-trivial decisions: what / when / tradeoff / risk / migration cost.
5. Produce the contract: stack, boundaries, data model, integration patterns, security model, deployment, failure modes, open questions. Do not document field-level API contracts — those live in code.
6. Save to `docs/architecture/feature-name.md`. This is the technical source of truth across sessions.
7. On approval, use **adr** for decisions affecting system boundaries, data ownership, or public APIs.

**Done when:** Document saved. Suggest **grill-me** to pressure-test before implementation.
