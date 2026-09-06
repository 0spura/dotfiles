---
name: adr
description: Record an approved, costly-to-reverse architecture decision affecting boundaries, data ownership, public contracts, infrastructure, security, or migration strategy.
---

# ADR

Record a costly, approved architecture decision in `ai-memory` as a compact, pinned historical record. The current SRS and architecture documents remain the source of the active contract; agents should retrieve only the relevant decision summary, not load the entire decision history.

## Workflow

1. Read the active issue, relevant requirements, existing memory decisions, and decision approval.
2. Confirm that the choice is costly to reverse or affects boundaries, data ownership, public contracts, infrastructure, security, or migration.
3. If the decision is not approved, present options and stop; do not turn a proposal into an accepted ADR.
4. Write a pinned decision under `decisions/` in `ai-memory`. For a changed decision, create a new entry that supersedes the old one; do not rewrite the historical decision or copy its obsolete text into active requirements.

Include:

```markdown
# Decision title

- Status: Proposed | Accepted | Superseded by [memory path or ID]
- Date: YYYY-MM-DD

## Context
## Decision
## Consequences
## Optional: Alternatives
## Optional: Traceability
```

Link requirement IDs and related issues where they exist. Use the memory page path or ID when superseding a prior accepted ADR. Keep the status and supersession link in memory metadata; do not require a duplicate ADR file unless the repository explicitly uses ADR files as a review or release artifact.

Use `Proposed` only while approval is pending and `Accepted` only after explicit approval. When superseding an ADR, update only the old memory entry's status and link to the replacement; do not edit its historical decision or consequences. The replacement must state what is currently in force and why the previous choice no longer applies.

## Done when

The pinned memory decision has an unambiguous status, decision, and consequences.
Record its path, status, and consequences with `record_work` using phase
`architecture`. Include alternatives, traceability, and links only when they
clarify the decision or connect it to active requirements or architecture.
