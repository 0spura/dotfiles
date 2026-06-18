---
name: adr
description: "Use when documenting an architecture decision: creating, updating, or superseding ADRs after a significant technical choice is approved."
---

# ADR (Architecture Decision Record)

Use when a significant technical decision needs to be recorded — one that is costly to reverse or materially affects system boundaries, data ownership, public APIs, infrastructure, auth/security posture, or migration strategy.

Do not create ADRs for routine implementation details or tentative ideas. An ADR documents a committed decision, not a discussion.

## When To Create

Create when the user asks, or proactively suggest it when **architecture-design** or **grill-me** approves a decision affecting:
- Service or module boundaries
- Data ownership or persistence model
- Public API or event contracts
- Infrastructure and deployment topology
- Authentication, authorization, or security posture
- Migration or backwards-compatibility strategy

## File Convention

Follow the repo's existing ADR convention when one exists. Otherwise:

```
docs/adr/NNNN-short-title.md
```

Choose the next available four-digit sequence. Never renumber existing ADRs.

## Template

```markdown
# NNNN: Decision title

- Status: Proposed | Accepted | Superseded by [NNNN](#link)
- Date: YYYY-MM-DD

## Context
Why this decision is needed. The forces at play, constraints, and what would happen without a decision.

## Decision
What was chosen. Be direct — one paragraph.

## Alternatives Considered
Required. Each viable alternative and why it was not selected.
If only one option existed, explain why no other approach was viable.

## Consequences
Positive outcomes, costs, risks, and follow-up work this decision creates.

## Traceability
- Requirements: [RF-XXX.N links from docs/srs.md — or "—" if not requirement-driven]
- Plan: [docs/plans/<feature>.md — or "—" if not tied to a specific feature]
```

## Lifecycle

- `Proposed` — decision recommended but not yet approved.
- `Accepted` — approved and in effect.
- `Superseded` — replaced by a newer ADR. Update this record's status to `Superseded by [NNNN](link)` and mark the new ADR as `Accepted`. Never delete superseded ADRs.
