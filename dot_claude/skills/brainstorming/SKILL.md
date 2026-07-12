---
name: brainstorming
description: "Explore how something should work before building it (product philosophy, component design, or feature behavior) and converge on an approved design."
allowed-tools: Read, Grep, Glob, Write, Edit
model: opus
effort: high
---

# Brainstorming

Converge on an approved design, not a large document. Explore how something should work before it is built.

## Scopes

| Scope | Reads | Output | Next |
|---|---|---|---|
| **Product** | `docs/product/discovery.md` | saves `docs/product/vision.md` | **srs** |
| **Component** | `docs/product/vision.md`, `docs/architecture.md`, component code | conversational, no file | **grill-me** (if data model, public API, or irreversible infra), else **architecture-design** |
| **Feature** | `docs/product/vision.md`, relevant `docs/srs.md` section | conversational, no file | **grill-me** (if auth, data model, or external contracts), else **srs**; **ux-design agent** (flow scope) if significant UI |

- **Product:** philosophy, north star, principles, for a new product or a change of direction.
- **Component:** a module, plugin, integration, or service, with its boundaries, interfaces, responsibilities, tech choices.
- **Feature:** a specific behavior inside an existing component.

When an idea crosses a scope, like a feature that introduces a new boundary or a component that redefines a principle, switch scope before continuing.

## How to explore

- Stay inside the stated scope; surface adjacent concerns only when asked.
- Read the repo before asking what the code already answers, and ask one question at a time, multiple-choice where it helps.
- Explore the direction the user pointed at rather than manufacturing alternatives. Offer 2 to 3 options only when the decision is genuinely open, each with what it is, when it fits, and its main tradeoff and risk, recommendation first.
- Roadmap position, phase, and delivery order belong in the tracker backlog.
- Source stays untouched here, with no code, scaffolding, or edits. With no product context yet (competitors, market, ICP), suggest the **product-discovery agent** first.

## Process

1. Read the context for the scope. With a doc missing, proceed from the user's description and flag what is assumed.
2. Clarify only what would materially change the direction.
3. Present the design: **Product** uses `reference/vision-template.md`; **Component** covers Problem, Boundaries, Interfaces, Responsibilities, Tech choices, Risks; **Feature** covers Problem, Core use case, MVP scope, Non-goals, User flow, Risks.
4. Get approval and revise. For Product scope, save `docs/product/vision.md`.

## Done When

Design approved. Suggest the next skill per the Scopes table.
