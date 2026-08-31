---
name: adr
description: Record an approved, costly-to-reverse architecture decision affecting boundaries, data ownership, public contracts, infrastructure, security, or migration strategy.
---

# ADR

Record an ADR in `ai-memory` only after the decision is approved.

## Workflow

1. Read relevant requirements, architecture, existing memory decisions, and decision approval.
2. Confirm that the choice is costly to reverse or affects boundaries, data ownership, public contracts, infrastructure, security, or migration.
3. If the decision is not approved, present options and stop; do not turn a proposal into an accepted ADR.
4. Write a pinned decision under `decisions/` in `ai-memory`. For a changed decision, create a new entry that supersedes the old one; do not rewrite the historical decision.

Include:

```markdown
# Decision title

- Status: Proposed | Accepted | Superseded by [memory path or ID]
- Date: YYYY-MM-DD

## Context
## Decision
## Alternatives Considered
## Consequences
## Traceability
```

Link requirement IDs and tracker work where they exist. Use the memory page path or ID when superseding a prior accepted ADR.

Use `Proposed` only while approval is pending and `Accepted` only after explicit approval. When superseding an ADR, update the old memory entry's status and link to the replacement; do not edit its historical decision or consequences.

## Done when

The pinned memory decision has an unambiguous status, decision, rejected alternatives, consequences, traceability, and links from affected architecture or requirement documents.
