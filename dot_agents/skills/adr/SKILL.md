---
name: adr
description: Record an approved, costly-to-reverse architecture decision as a durable ai-memory record, with a repository ADR file only when the project requires one.
---

# ADR

The SRS and architecture documents stay the active contract; the ai-memory record is durable history, not a replacement for them.

## Workflow

1. Confirm explicit approval, and that the choice is costly to reverse or affects boundaries, data ownership, public contracts, infrastructure, security, or migration.
2. Record a self-contained decision with `mcp__ai_memory_memory_write_page`: status, date, decision, consequences, source paths, tracker identifier, and any superseded page path.
3. When a decision supersedes another, cite that page and write the replacement separately; historical evidence is never overwritten or invalidated.
4. Write `docs/adr/` only when the repository already treats ADR files as a review or release artifact. There the file is authoritative and the ai-memory record links to it.

## Structure

```markdown
# Decision title

- Status: Proposed | Accepted | Superseded
- Date: YYYY-MM-DD
- Tracker: [identifier]

## Context
## Decision
## Consequences
## Alternatives
## Traceability
```

## Done when

The decision has explicit approval, an unambiguous status, its consequences, and traceability to the active contract.
