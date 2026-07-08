---
name: adr
description: "Record an architecture decision by creating, updating, or superseding an ADR after a significant, costly-to-reverse technical choice is approved."
model: sonnet
effort: low
---

# ADR (Architecture Decision Record)

Record a committed decision that is costly to reverse or that materially shapes system boundaries, data ownership, public APIs, infrastructure, auth or security posture, or migration strategy. An ADR captures a decision, not a discussion, so routine implementation details and tentative ideas stay out.

## When to create

On the user's request, or proactively when **architecture-design** or **grill-me** approves a decision affecting:

- Service or module boundaries.
- Data ownership or persistence model.
- Public API or event contracts.
- Infrastructure and deployment topology.
- Authentication, authorization, or security posture.
- Migration or backwards-compatibility strategy.

## File convention

Follow the repo's existing ADR convention. Absent one, use `docs/adr/NNNN-short-title.md` with the next four-digit sequence; existing ADRs keep their numbers.

## Template

```markdown
# NNNN: Decision title

- Status: Proposed | Accepted | Superseded by [NNNN](#link)
- Date: YYYY-MM-DD

## Context
Why the decision is needed: the forces at play, constraints, and what happens without it.

## Decision
What was chosen, in one direct paragraph.

## Alternatives Considered
Required. Each viable alternative and why it lost. If only one option existed, why no other was viable.

## Consequences
Positive outcomes, costs, risks, and the follow-up work this creates.

## Traceability
- Requirements: [RF-XXX.N links from docs/srs.md, or "none"]
- Tracker: [work item reference, or "none"]
```

## Lifecycle

- `Proposed`: recommended, not yet approved.
- `Accepted`: approved and in effect.
- `Superseded`: replaced by a newer ADR. Set this record's status to `Superseded by [NNNN](link)`, mark the new one `Accepted`, and keep both.
