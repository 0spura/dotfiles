---
name: implementation-plan
description: Turn approved requirements into typed tracker work items, shaped from a template and ready for the implementation loop to dispatch.
model: opus
effort: medium
---

# Implementation Plan

The single creation point for every work item the **implementation** loop executes. Shape items here; write no code.

## Item types

An item's type lives in its title prefix, which picks its template and its executor:

| Type | Prefix | Template | Executor |
|---|---|---|---|
| Feature | `feat(<scope>):` | `reference/feature.md` | implement-item |
| Refactor | `refactor(<scope>):` | `reference/refactor.md` | implement-item (behavior frozen) |
| Bug | `fix(<scope>):` | `reference/bug.md` | debug |
| Performance | `perf(<scope>):` | `reference/perf.md` | perf |

Load only the template for the type you are creating. `<scope>` is the domain, layer, or module in lowercase (`auth`, `api`, `db`, `ui`); the description is lowercase and imperative. Good: `feat(auth): rotate refresh token and detect replay`.

## Working through the tracker

Every item, field, and link goes through the tracker MCP, mapped to whatever it exposes, never a hardcoded provider name, URL, or field name. Reach for native fields before labels: status, priority, size, iteration, type, assignee, sub-items, relationships. Labels carry only durable cross-cutting classification.

**Implementation Surface** is load-bearing: the loop compares each item's declared files or modules to decide what runs in parallel, so an item that touches a file lists it. Items that share a surface carry a relationship, which serializes them.

Requirements arrive settled: the SRS is approved and grill-me is done. Translate them into tasks; leave refining, re-scoping, and re-prioritizing upstream. Reference requirement IDs; the SRS keeps their text. Sequence by technical structure (surface, dependencies, blocking order), since the SRS already fixed business priority.

## Slicing the work

Cut a feature into **vertical tracer bullets**: each item a thin path through every layer it touches (schema, service, API, UI, test), verifiable on its own rather than a horizontal slice of one layer. A child item exists where a slice has its own PR or commit scope, dependency, or risk; otherwise the feature stays one item with a checklist. Prefactor first, making the change easy before making the easy change, as its own slice when the groundwork is worth isolating.

A **wide refactor** is the exception, since one mechanical change (rename a column, retype a shared symbol) fans across the codebase and no vertical slice lands green. Sequence it as **expand-contract**:

1. **Expand:** add the new form beside the old so nothing breaks.
2. **Migrate:** move call sites over in batches sized by blast radius, per package or directory, each batch its own item blocked by the expand, keeping CI green because the old form still exists.
3. **Contract:** delete the old form once no caller remains, in an item blocked by every migrate batch.

## Process

1. Identify the type and scope of what is being planned.
2. Reuse an existing parent or child item before creating a duplicate.
3. Gather only the evidence this item needs: the SRS, architecture, or ADR sections it touches, or a bug's repro.
4. Read the matching template and fill it, leaving the fields marked for the agent blank.
5. Slice per "Slicing the work" and create the items, each carrying its Implementation Surface.
6. Set native fields and relationships, and build each requirement source link from the tracker's host and repo, falling back to `docs/srs.md#<req-id>` when it exposes no browsable URL.
7. Present the items, their types, and the next unblocked one.

## Done When

Every item is typed, shaped from its template, and carries an accurate Implementation Surface, native fields, and relationships, ready for the loop to dispatch.
