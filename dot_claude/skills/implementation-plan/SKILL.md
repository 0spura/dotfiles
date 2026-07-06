---
name: implementation-plan
description: "Create tracker work items of any type — feature, bug, perf, refactor — before implementation. Loads the per-type template on demand and tags each item so the implementation loop can dispatch it."
---

# Implementation Plan

Use this skill to create tracker work items. It is the single creation point for every item type; the **implementation** loop then executes them, dispatching each to its agent by type. Do not implement code here.

## Item Types

Each item carries a type, encoded in its title prefix. The type decides the template and the executor:

| Type | Title prefix | Template | Executor |
|---|---|---|---|
| Feature | `feat(<scope>):` | `reference/feature.md` | implement-item |
| Refactor | `refactor(<scope>):` | `reference/refactor.md` | implement-item (behavior frozen) |
| Bug | `fix(<scope>):` | `reference/bug.md` | debug |
| Performance | `perf(<scope>):` | `reference/perf.md` | perf |

Read the matching template only for the type you are creating — do not load all four.

`<scope>` is the domain, layer, or module — lowercase, no spaces (`auth`, `api`, `db`, `ui`). Description is lowercase, imperative, no period, no em-dash. Good: `feat(auth): rotate refresh token and detect replay`. Bad: `auth: refresh token — rotation and replay`.

## Principles

- Drive every work-item, field, and link operation through the tracker MCP. Never hardcode provider names, URL schemes, or field names — map to whatever the tracker exposes.
- Use native tracker fields before labels: status, priority, estimate/size, iteration/cycle, release grouping, type, assignee, sub-items, relationships. Set the item type in a native type field when the tracker has one; otherwise the title prefix is authoritative.
- Use labels only for durable cross-cutting classification from the repository taxonomy.
- **Implementation Surface is load-bearing** on every type: the loop compares surfaces to decide what runs in parallel. An item that touches a file must list it, or two agents may edit the same file at once.
- Requirements are already settled upstream. By this phase the SRS is approved and grill-me is done — this skill translates locked requirements into executable tasks. It does not refine, re-prioritize, or re-scope them. If a requirement still feels ambiguous, stop and go back to the SRS; do not resolve it here.
- Work items carry the approved spec forward — they do not redefine SRS, architecture, or ADRs. Reference requirement IDs; do not restate them.
- Decompose and sequence by technical structure: implementation surface, dependencies, and execution order from blocking relationships — not from business priority, which the SRS already fixed.
- Do not create repo plan files.

## Process

1. **Identify the type and scope** of what is being planned. For a feature, this follows an approved architecture; for a bug/perf/refactor, it can be filed reactively.
2. **Reuse** existing parent/child items when possible instead of duplicating.
3. **Gather only targeted evidence** for this item — relevant SRS/architecture/ADR sections, or the repro/symptom for a bug. Do not scan the whole project.
4. **Read the matching template** from `reference/` and fill it. Leave the fields marked "filled by the agent" blank — for bug and perf, the empirical discovery (root cause, bottleneck) happens at execution.
5. **Define the Implementation Surface** at module/folder level for every item, so the loop can judge parallel-safety.
6. **Build requirement source links** (feature items) from the host, repo, and default branch in the tracker context — never a hardcoded domain. If the tracker exposes no browsable URL, fall back to the repo-relative path `docs/srs.md#<req-id>`.
7. **Create the item(s).** For a feature, create the parent, then child items only when a piece has its own PR/commit scope, dependency, risk, or discussion. A large refactor is split into refactor child items. Otherwise a single item suffices.
8. **Set native tracker fields** (type, priority, size, iteration) when available.
9. **Set relationships** — blocked, blocking, related, duplicate — through the tracker, not by listing numbers in the body. Items sharing an Implementation Surface should carry a relationship so the loop serializes them.
10. **Present** the resulting items, their types, and the next unblocked item.

## Done When

The backlog has each item typed, shaped from its template, given native fields and relationships, with an accurate Implementation Surface — ready for the implementation loop to dispatch.
