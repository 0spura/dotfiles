---
name: implementation-plan
description: Turn approved requirements into typed tracker work items, shaped from a template and ready for the implementation loop to dispatch.
---

# Implementation Plan

The single creation point for every work item the **implementation** loop executes. Shape items here; write no code.

## Item types

An item's type lives in its title prefix, which picks its template and its executor:

| Type | Prefix | Executor |
|---|---|---|
| Feature | `feat(<scope>):` | implement-item |
| Refactor | `refactor(<scope>):` | implement-item (behavior frozen) |
| Bug | `fix(<scope>):` | debug |
| Performance | `perf(<scope>):` | perf |

`<scope>` is the domain, layer, or module in lowercase (`auth`, `api`, `db`, `ui`); the description is lowercase and imperative.

## Slicing the work

Cut a feature into **vertical tracer bullets**: each item a thin path through every layer it touches (schema, service, API, UI, test), verifiable on its own rather than a horizontal slice of one layer. A child item exists where a slice has its own PR or commit scope, dependency, or risk; otherwise the feature stays one item with a checklist. Prefactor first, making the change easy before making the easy change, as its own slice when the groundwork is worth isolating.

A **wide refactor** is the exception. Sequence it as **expand-contract**:

1. **Expand:** add the new form beside the old so nothing breaks.
2. **Migrate:** move call sites over in batches sized by blast radius, each batch its own item.
3. **Contract:** delete the old form once no caller remains.

## Process

1. Identify the type and scope of what is being planned.
2. Reuse an existing parent or child item before creating a duplicate.
3. Gather only the evidence this item needs: the SRS, architecture, or ADR sections it touches.
4. Slice per "Slicing the work" and create the items.
5. Present the items, their types, and the next unblocked one.

## Done When

Every item is typed, shaped, and carries an accurate Implementation Surface, ready for the loop to dispatch.
