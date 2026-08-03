---
name: memory-pipeline
description: Transversal reference for how the development pipeline uses ai-memory. Defines namespaces, query patterns, and what each phase writes after completion.
---

# Memory Pipeline

This skill defines how each phase of the development pipeline reads from and writes to ai-memory, creating a persistent knowledge graph across sessions. Every skill that produces a deliverable writes a summary; every skill that consumes prior context queries first.

## Namespaces

| Namespace | Owner phases | Content |
|---|---|---|
| `product` | product-discovery, brainstorming | Discovery findings, vision, principles, anti-goals |
| `requirements` | srs | Requirement summaries, domain map, priority tiers |
| `architecture` | architecture-design, adr | Component boundaries, API contracts, data model, ADR decisions |
| `implementation` | implementation, implementation-plan | Backlog shape, completed items, integration notes |
| `review` | pull-request, code-reviewer | Review findings, recurring patterns, tech debt |
| `decisions` | grill-me, adr | Decision rationale, alternatives rejected, constraints surfaced |
| `sessions` | hooks (automatic) | Session summaries, handoff context, work-in-progress state |

## Query Patterns

### Before starting a phase

```
@ai-memory/memory_query
  namespace: <phase-namespace>
  query: <project-name OR feature-name OR domain keywords>
```

Use to retrieve:
- Prior decisions that constrain the current work
- Context from a previous session on the same feature
- Related findings from adjacent phases

### Cross-namespace queries

When a phase needs context from another:
- **architecture-design** queries `requirements` and `decisions`
- **implementation** queries `architecture` and `requirements`
- **pull-request** queries `review` for recurring patterns
- **brainstorming** queries `product` and `decisions`

## Write Patterns

### After completing a phase

```
@ai-memory/memory_write_page
  namespace: <phase-namespace>
  page_title: <phase>/<project-or-feature>/<date-or-version>
  content: |
    ## Summary
    [Key outputs and decisions]

    ## Artifacts
    [Files created or updated]

    ## Open Questions
    [Unresolved items for downstream phases]

    ## Context for Next Session
    [What someone resuming this work needs to know]
```

### Page title conventions

- `product/discovery/<project>`
- `requirements/srs/<project>/<domain>`
- `architecture/<project>/<concern>`
- `decisions/<project>/<decision-slug>`
- `implementation/<project>/<item-slug>`
- `review/<project>/<pr-number>`
- `sessions/<date>/<summary-slug>`

## Lifecycle Integration

The ai-memory hooks (session-start, session-end) handle automatic session context. Phase-specific writes are the skill's responsibility:

1. **Query** at phase start for prior context.
2. **Execute** the phase.
3. **Write** a summary page after the deliverable is saved.

This ensures continuity across sessions without relying on conversation history.
