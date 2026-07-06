---
name: brainstorming
description: "Use before building anything: explore product philosophy, component design, or feature behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
allowed-tools: Read, Grep, Glob, Write, Edit
---

# Brainstorming

Use when exploring how something should work before building it. Goal: converge on an approved design — not produce a large document.

## Scopes

| Scope | Reads | Output | Next |
|---|---|---|---|
| **Product** | `docs/product/discovery.md` | saves `docs/product/vision.md` | **srs** |
| **Component** | `docs/product/vision.md`, `docs/architecture.md`, component code | conversational — no file | **grill-me** (if data model / public API / irreversible infra), else **architecture-design** |
| **Feature** | `docs/product/vision.md`, relevant `docs/srs.md` section | conversational — no file | **grill-me** (if auth / data model / external contracts), else **srs**; **ui-design agent** (flow scope) if significant UI |

- **Product** — philosophy, north star, principles. Starting a new product or redefining its direction.
- **Component** — a module, plugin, integration, or service: boundaries, interfaces, responsibilities, tech choices.
- **Feature** — a specific behavior inside an existing component.

If an idea crosses a scope — a feature that introduces a new boundary, or a component that redefines a principle — switch scope before continuing.

## Constraints

- If no product context exists yet (competitors, market position, ICP), suggest the **product-discovery agent** first.
- No implementation, code scaffolding, or edits to source during brainstorming.
- Stay within the stated scope. Do not expand the problem or surface adjacent concerns unless asked.
- One question at a time. Use multiple-choice when it helps.
- Inspect the repo before asking questions the code already answers.
- Do not suggest roadmap positioning, phase assignment, or implementation order — that belongs in the tracker backlog.

## Process

1. Read the context for the scope (see table). If a doc is missing, proceed from the user's description and flag what is assumed as unverified.
2. Clarify only if a missing piece would materially change the direction.
3. If the user pointed to a direction, explore it — don't offer alternatives for completeness. Present 2–3 options only when the decision is genuinely open. For each: what it is, when it works well, main tradeoff, risk. Lead with the recommended option when there is signal.
4. Present the design for the scope:
   - **Product** — use `reference/vision-template.md`.
   - **Component** — Problem · Boundaries · Interfaces · Responsibilities · Tech choices · Risks.
   - **Feature** — Problem · Core use case · MVP scope · Non-goals · User flow · Risks.
5. Get approval. Revise if needed. For Product scope, save to `docs/product/vision.md`.

## Done When

Design approved. Suggest the next skill per the Scopes table.
