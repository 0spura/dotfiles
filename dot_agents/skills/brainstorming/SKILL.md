---
name: brainstorming
description: "Use before building a product, component, or feature: explore philosophy, module boundaries, behavior, edge cases, and tradeoffs. Produce an approved design before implementation."
---

# Brainstorming

Use when exploring how something should work before building it. Goal: converge on an approved design — not produce a large document.

## Scopes

- **Product** — philosophy, north star, principles, anti-goals, and product direction. Use when starting a new product or redefining its direction. Saves to `docs/product/vision-and-strategy.md`.
- **Component** — module, plugin, integration, or service design. Covers boundaries, interfaces, responsibilities, and tech choices for a delimited part of the system. Conversational — no file saved.
- **Feature** — specific behavior within an existing component. Conversational — no file saved.

## Constraints

- If no product context exists yet (competitors, market position, ICP), suggest **product-discovery** first.
- No implementation, code scaffolding, or file edits during brainstorming.
- Stay within the stated scope. Do not expand the problem or surface adjacent concerns unless asked.
- One question at a time. Use multiple-choice when it helps.
- Inspect the repo before asking questions the code already answers.
- Do not suggest roadmap positioning, phase assignment, or implementation order — sequencing belongs in the backlog or `docs/roadmap.md`, not here.

## Process

1. Read relevant code, docs, and existing patterns.
   - **Product scope:** read `docs/product/discovery.md` if it exists. If not, proceed from the user's description and call out which market context is assumed.
   - **Component scope:** read `docs/product/vision-and-strategy.md`, `docs/architecture.md`, and any existing code for the component being designed.
   - **Feature scope:** read `docs/product/vision-and-strategy.md` and the relevant section of `docs/srs.md` if they exist.
2. Clarify only if a missing piece would materially change the direction. If scope is already clear, skip.
3. If the user pointed to a direction, explore it — don't offer alternatives for completeness. Only present 2–3 options when the decision is genuinely open. For each: what it is, when it works well, main tradeoff, risk. Lead with the recommended option when there is enough signal.
4. Present a design using only the sections that fit the scope (see templates below).
5. Get approval. Revise if needed.
6. Product scope: save the approved design to `docs/product/vision-and-strategy.md`. Component and feature scopes: approval is conversational — no file saved.

## Templates

**Feature design** (conversational — not saved to file):

Problem · Core use case · MVP scope · Non-goals · User flow · Risks

**Product scope** → `docs/product/vision-and-strategy.md`:

```markdown
# Vision and Strategy — [Product Name]

## Purpose
The problem worth solving and why this product exists to solve it.

## Aspiration
What this product becomes when fully realized. Not a roadmap.

## Users
The specific person this is built for, narrow enough to make real trade-offs.

## Product Strategy
Positioning, niche, and the choices that make the product defensible.

## System Direction
High-level modules, technical direction, and cross-cutting constraints. Details go in `docs/project.md` and `docs/architecture.md`.

## Principles
Non-negotiable constraints that filter product and technical decisions.

## Anti-goals
What this product deliberately is not.

## Open Questions
Decisions not yet made that materially affect product or system shape.
```

## Done When

Design approved.
- Product scope → suggest **srs** to formalize what the system must do.
- Component scope → if the design includes data model changes, public API contracts, or irreversible infrastructure decisions, suggest **grill-me** before **architecture-design**. Otherwise suggest **architecture-design** directly.
- Feature scope → if the feature touches auth, data model, or external contracts, suggest **grill-me**. Otherwise suggest **srs** to add the feature requirements.
