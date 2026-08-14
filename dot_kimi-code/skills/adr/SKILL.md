---
name: adr
description: "Record an approved, costly-to-reverse architecture decision."
whenToUse: "Use after a decision is approved and only when it is costly to reverse or affects boundaries, data ownership, public contracts, infrastructure, security, or migration strategy."
---

# ADR (Architecture Decision Record)

Create an ADR only after the decision is approved. Use the repository convention; otherwise create `docs/adr/NNNN-short-title.md` with the next sequence.

## Workflow

1. Read relevant requirements, architecture, existing ADRs, and decision approval.
2. Confirm that the choice is costly to reverse or affects boundaries, data ownership, public contracts, infrastructure, security, or migration.
3. If the decision is not approved, present options and stop; do not turn a proposal into an accepted ADR.
4. Create a new ADR for a changed decision. Do not rewrite the substance of an accepted ADR.

Include:

```markdown
# NNNN: Decision title

- Status: Proposed | Accepted | Superseded by [NNNN](#link)
- Date: YYYY-MM-DD

## Context
## Decision
## Alternatives Considered
## Consequences
## Traceability
```

Link requirement IDs and tracker work where they exist. Supersede rather than overwrite a prior accepted ADR.

Use `Proposed` only while approval is pending and `Accepted` only after explicit approval. When superseding an ADR, update the old status and link to the replacement; do not edit its historical decision or consequences.

## Done When

The ADR has an unambiguous status, decision, rejected alternatives, consequences, traceability, and links from affected architecture or requirement documents.
