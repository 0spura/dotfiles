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
- Tracker-agnostic: drive every work-item, field, and link operation through the tracker MCP, and derive host/repo/default branch from its context (`tracker_get_context`). Never assume a provider (GitHub, GitLab, Linear) or hardcode its URL scheme — map to whatever native fields the tracker exposes.
- Use native tracker fields before labels: status, priority, estimate/size, iteration/cycle, release grouping (milestone/project), type, assignee, sub-items, and relationships — whatever the tracker offers.
- Use labels only for durable cross-cutting classification from the repository taxonomy.
- Use the release-grouping field (milestone, cycle, or equivalent) only for delivery grouping, not feature grouping.
- Do not create repo plan files.

## Method

Work items carry the approved spec forward — they do not redefine SRS, architecture, or ADRs. Each item names the focused test or check that proves it before implementation (SDD at system level, TDD at task level).

## Title Format

```
<scope>: <imperative description>
```

- `scope` is the domain, layer, or module prefix — lowercase, no spaces (e.g. `auth`, `api`, `db`, `infra`, `ui`)
- description is lowercase, imperative, no period, no em-dash, no parenthetical suffixes
- Bad: `api: refresh token — rotação e detecção de replay`
- Good: `auth: rotate refresh token and detect replay via token families`

Child item titles follow the same format; use a tighter scope if the parent already sets the domain.

## Work Item Shape

Parent feature item:

```markdown
## Goal
[one paragraph]

## Scope
Source: [docs/srs.md#req-id](<link built from tracker context — see Process step 7>), ...

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
7. Build each requirement's source link from the host, repo, and default branch reported by the tracker context (`tracker_get_context`) — never a hardcoded domain. If the tracker exposes no browsable URL, fall back to the repo-relative path `docs/srs.md#<req-id>`. Each requirement ID gets its own link.
8. Create or update the parent feature item.
9. Create child items only when they reduce coordination risk; otherwise use parent checklists.
10. Set native tracker fields when available.
11. Use relationships/child items for blocked, blocking, related, and duplicate links. Do not list related item numbers in the body unless automation is unavailable.
12. Present the final work item structure and next unblocked item.

## Done When

The feature has a parent item, any necessary child items, native tracker fields, relationships, and an approved execution order.
