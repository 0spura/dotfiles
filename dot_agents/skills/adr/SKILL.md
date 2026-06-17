---
name: adr
description: "Use when documenting an architecture decision: creating, updating, or superseding ADRs after a significant technical choice is approved."
---

# ADR (Architecture Decision Record)

**When to use:** A significant technical decision was approved and needs to be recorded. Trigger: "document this decision", "create an ADR", "record this choice".

**Goal:** A committed decision on record — context, what was chosen, alternatives rejected, and consequences.

**Constraints:**
- Only for committed decisions, not tentative ideas or routine implementation details.
- Never renumber or delete existing ADRs. Superseded ADRs stay, marked as `Superseded by [NNNN]`.
- File path: `docs/adr/NNNN-short-title.md` (next available sequence), unless the repo has a different convention.

**Format:**
```markdown
# NNNN: Decision title

- Status: Proposed | Accepted | Superseded by [NNNN](#link)
- Date: YYYY-MM-DD

## Context
Why this decision is needed and what would happen without it.

## Decision
What was chosen. One paragraph, direct.

## Alternatives Considered
Each viable alternative and why it was not selected.

## Consequences
Positive outcomes, costs, risks, and follow-up work.
```

**Done when:** ADR file created at `docs/adr/NNNN-short-title.md`.
