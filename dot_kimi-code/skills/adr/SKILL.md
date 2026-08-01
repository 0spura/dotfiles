---
name: adr
description: "Record an architecture decision by creating, updating, or superseding an ADR after a significant, costly-to-reverse technical choice is approved."
whenToUse: "Use when architecture-design or grill-me approves a decision affecting service boundaries, data ownership, public APIs, infrastructure, auth, security posture, or migration strategy."
---

# ADR (Architecture Decision Record)

Record a decision that is costly to reverse. Write it once, pin it, and supersede it instead of editing it later. An ADR captures a decision, not a discussion, so routine implementation details and tentative ideas stay out.

## When to write

Write an ADR when a decision:

- Affects service boundaries, data ownership, or public APIs.
- Changes infrastructure, auth, or security posture.
- Chooses between alternatives that are hard to revisit.
- Has consequences that outlive the current task.

## Structure

Use this structure in the body:

```markdown
# <Decision title>

**Status:** accepted   <!-- proposed | accepted | superseded by [[decisions/other]] -->

## Context
What situation forced a decision; the constraints that mattered.

## Decision
What was decided, stated as a fact.

## Consequences
What becomes easier, what becomes harder, what was given up.
Rejected alternatives and WHY, so future sessions don't re-propose them.

## Traceability
- Requirements: [RF-XXX links from docs/srs.md, or "none"]
- Tracker: [work item reference, or "none"]
```

## Process

1. If one exists and the decision changes, write a NEW page and set the old page's status line to `superseded by [[decisions/<new>]]`. Never edit the old decision's substance.
2. Write the new ADR with `memory_write_page` under `decisions/<short-slug>.md`, `pinned: true`.
3. Reference the ADR from `docs/architecture.md` when the decision affects the architecture document.

## Done When

The ADR is written, pinned, and linked from the relevant docs. Future agents can find it via memory query.
