---
name: brainstorming
description: Explore how something should work before building it (product philosophy, component design, or feature behavior) and converge on an approved design.
---

# Brainstorming

Converge on an approved design, not a large document. Explore how something should work before it is built.

## Scopes

| Scope | Reads | Output | Next |
|---|---|---|---|
| **Product** | `docs/product/discovery.md` | saves `docs/product/vision.md` | **srs** |
| **Component** | `docs/product/vision.md`, `docs/architecture.md`, component code | conversational, no file | **grill-me** or **architecture-design** |
| **Feature** | `docs/product/vision.md`, relevant `docs/srs.md` section | conversational, no file | **grill-me** or **srs** |

- **Product:** philosophy, north star, principles, for a new product or a change of direction.
- **Component:** a module, plugin, integration, or service, with its boundaries, interfaces, responsibilities, tech choices.
- **Feature:** a specific behavior inside an existing component.

## How to explore

- Stay inside the stated scope; surface adjacent concerns only when asked.
- When the user signals unfamiliarity with the domain, open with a blind-spot pass: name what they likely don't know to ask before interviewing them on it.
- Read the repo before asking what the code already answers, and ask one question at a time.
- Explore the direction the user pointed at rather than manufacturing alternatives. Offer 2 to 3 options only when the decision is genuinely open, each with what it is, when it fits, and its main tradeoff and risk, recommendation first.
- Source stays untouched here: no code, scaffolding, or edits.

## Process

1. Read the context for the scope.
2. Clarify only what would materially change the direction.
3. Present the design.
4. Get approval and revise. For Product scope, save `docs/product/vision.md`.

## Done When

Design approved. Suggest the next skill per the Scopes table.
