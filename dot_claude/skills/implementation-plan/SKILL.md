---
name: implementation-plan
description: "Use after architecture is approved and grill-me is done: create concise tracker work items for one feature before implementation."
---

# Implementation Plan

Use this skill to turn one approved feature into tracker work items. Do not implement code here.

## Principles

- Plan exactly one selected feature at a time.
- Use the parent work item as the feature boundary.
- Use child work items only when work has its own PR/commit scope, dependency, risk, or discussion. Otherwise use a checklist in the parent item.
- Use native tracker fields before labels: Status, Priority, Effort, Size, Estimate, Iteration, Milestone, type, assignee, child items, and relationships.
- Use labels only for durable cross-cutting classification from the repository taxonomy.
- Use Milestone only for release/delivery grouping, not feature grouping.
- Use the tracker MCP tools to create and update work items.
- Do not create repo plan files.

## Method

- SDD at system level: SRS, architecture, and ADRs are the approved spec; work items must not redefine them.
- TDD at task level: each child item/checklist task should include the focused test or check that proves it works before implementation.

## Work Item Shape

Parent feature item:

```markdown
## Goal
[one paragraph]

## Scope
Source: `docs/srs.md#...`

- Must:
- Should:
- Could:
- Won't:

## Implementation Surface
- `[path/module]` - [responsibility]

## Acceptance
- [ ] [observable result or requirement ID]

## Verification
- [command/check]

## Risk
[data, auth, migration, compatibility, performance, or Low]
```

Child item:

```markdown
## Task
[one concrete action]

## Requirement
SRS: `docs/srs.md#rf-xxxn` or `-`

## Files / Modules
- `[path/module]` - [expected responsibility]

## Acceptance
- [ ] [observable result]

## Verification
- [command/check]

## Test Strategy
- [unit/integration/e2e/static check and what it proves]

## Notes
[edge cases, migration notes, or "-"]
```

## Process

1. Ask which single feature to plan if it is not obvious.
2. Check existing parent/child items and reuse them when possible.
3. Check repo state only for targeted evidence related to this feature. Do not scan the whole project.
4. Read only the relevant SRS, architecture, and ADR context.
5. Sequence from the selected feature's MoSCoW priority and requirement dependencies.
6. Define the implementation surface at module/folder level. Do not over-specify classes/functions unless architecture already decided them.
7. Create or update the parent feature item.
8. Create child items only when they reduce coordination risk; otherwise use parent checklists.
9. Set native tracker fields when available.
10. Use relationships/child items for blocked, blocking, related, and duplicate links. Do not list related item numbers in the body unless automation is unavailable.
11. Present the final work item structure and next unblocked item.

## Done When

The feature has a parent item, any necessary child items, native tracker fields, relationships, and an approved execution order.
