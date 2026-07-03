---
name: ui-design
description: "Use after SRS to define interface structure: navigation, surfaces, and per-feature interaction flows. Produces docs/design/ so UI structure has a home and never drifts into the SRS."
allowed-tools: Read, Grep, Glob, Write, Edit
---

# UI Design

Use to define how the interface is structured — navigation, surfaces, and interaction flows — for products with significant UI. Goal: give UI structure a home in `docs/design/` so it stops leaking into the SRS or being produced ad-hoc. Skip entirely for APIs, CLIs, and libraries.

This skill owns interaction structure, not requirements and not implementation. It references SRS requirement IDs, never redefines them.

## Scope boundary

- **Is:** navigation model, surfaces, entry points, interaction steps, screen states (loading/empty/error), transitions — traced to `RF-XXX` IDs.
- **Is not** a requirement — what the system must do lives in `docs/srs.md`. Reference the ID; do not restate the rule.
- **Is not** backend — data model, storage, sync, retries live in `docs/architecture.md`.
- **Is not** visual/pixel design — color, spacing, typography, tokens are out of scope unless the user asks for them.
- **Is not** UI code structure — god components and file layout are handled by engineering defaults during **implementation**.

If you are stating a business rule or a stored field, stop — that belongs in SRS or architecture.

## Scopes

- **Structure** — durable interface architecture: global navigation, surfaces, when a flow uses a sheet vs full screen, product-wide UI principles. Saves to `docs/design/ui-architecture.md`. This is the *architecture* layer of the UI.
- **Flow** — one feature's interaction flow: entry points, steps, states, transitions, outcome. Saves to `docs/design/flows/<name>.md`. This is the *feature* layer of the UI.

## Routing

Identify the scope, then read ONLY the matching bundled file and follow it:

| Scope | Read |
|---|---|
| Structure | `scopes/structure.md` |
| Flow | `scopes/flow.md` |

If the scope is unclear, ask before reading. Do not read the other scope file — each is self-contained.
