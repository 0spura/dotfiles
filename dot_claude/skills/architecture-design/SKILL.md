---
name: architecture-design
description: "Use after the SRS is approved: define how requirements will be implemented — service boundaries, APIs, data model, integrations, failure modes, and technical contracts before coding."
---

# Architecture Design

Use after the SRS is approved. Goal: a clear technical contract that answers *how* the requirements will be implemented — not a large document.

The SRS defines the *what*. This skill defines the *how*. Do not rewrite or expand requirements here; reference them from the SRS. If a requirement is unclear, go back to the SRS before designing.

Do not implement while the architecture is being designed. Prefer the simplest design that satisfies the stated requirements. Be skeptical of new services, abstractions, queues, event buses, and generic layers unless they solve a concrete problem.

## Modes

Use the lightest mode that fits the request.

### Feature Architecture

Domain boundaries · states and transitions · API contracts · data model changes · rollout and backwards compatibility · observability

### System Integration

Ownership of each system · request/response or event contracts · idempotency and retries · auth · failure handling · rate limits, timeouts, backpressure · data consistency

### Modernization Or Refactor

Before proposing a new structure:
1. Identify behavior that must not change
2. Extract business rules from current code
3. Separate domain policy from technical plumbing
4. Call out magic numbers, thresholds, state transitions, validations, calculations
5. Identify where tests need to pin behavior before refactoring

### Architecture Critique

- Do we need this complexity?
- What is the simplest design that meets the requirements?
- Does each boundary reflect a real domain boundary?
- Which non-functional requirements are missing?
- What happens when a dependency is down?
- Is the migration story concrete?
- Are there abstractions with only one implementation and no clear second use?

## Process

### 1. Read The SRS

Read `docs/srs.md` (or the scoped SRS file). Use the `RF-XXX.N` requirement IDs as anchors — every significant architectural decision should trace back to a requirement. Also inspect existing code, schemas, routes, interfaces, tests, and existing ADRs.

### 2. Extract Business Rules

When current behavior matters, identify rules before designing changes:
- Calculations, fees, limits, thresholds, scores, rounding
- Validations and cross-field constraints
- Eligibility and authorization policy
- Lifecycle states and allowed transitions
- Retry limits, cutoff times, retention periods, escalation policy

Skip infrastructure-only details (logging, connection pooling, framework glue, UI layout).

If useful, format rules as:

```text
Rule:
Source: [RF-XXX.N]
Plain English:
Given / When / Then:
Parameters:
Confidence:
Open question:
```

### 3. Compare Options

For non-trivial decisions, present 2-3 options:

| Option | Best for | Tradeoff | Risk | Migration cost |
| --- | --- | --- | --- | --- |
| A | ... | ... | ... | ... |
| B | ... | ... | ... | ... |

Lead with the recommended option when there is enough signal.

### 4. Produce And Save The Architecture Document

Save to `docs/architecture/feature-name.md` (feature-scoped) or `docs/architecture/overview.md` (system-wide). This document is the technical source of truth across sessions — the agent reads it before making any implementation decision to avoid inventing solutions incompatible with what was already decided.

Use only the sections that fit:

```markdown
# Architecture — [Feature / System Name]

## Stack
Languages, frameworks, databases, infrastructure, and third-party services. One line per decision with the rationale.

## Boundaries
Service and module boundaries. What each owns, what it does not own.

## Data Model
Entities, relationships, and key fields. Enough to implement without ambiguity — not a full ERD.

## Integration Patterns
How components communicate: REST vs events vs RPC, sync vs async, auth mechanism, retry policy, idempotency approach, failure handling. Do not document field-level API contracts here — those live in code (OpenAPI annotations, route handlers). Document the pattern and the decisions around it.

## Security Model
Auth mechanism, permission model, trust boundaries, data sensitivity classification.

## Deployment
Where it runs, how it scales, environment differences (dev/staging/prod).

## Failure Modes
What fails, how it fails, and what the recovery path is.

## Open Questions
Decisions not yet made. Do not leave these implicit.
```

### 5. Document Significant Decisions

After the contract is approved, identify decisions that are costly to reverse: system boundaries, data ownership, public APIs, infrastructure, auth posture, migration strategy. Use the **adr** skill to document them.

### 6. Self-Critique Before Handoff

- Is this simpler than the obvious overbuilt version?
- Does every boundary have a reason?
- Is the data migration or compatibility story clear?
- Can one dependency failure be traced end to end?
- Are business rules preserved?
- Are missing values represented explicitly instead of silently defaulted?

If a major weakness remains, call it out. Then suggest **grill-me**.
