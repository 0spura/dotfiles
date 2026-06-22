---
name: brainstorming
description: "Use before building anything: explore product philosophy, component design, or feature behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
---

# Brainstorming

Use when exploring how something should work before building it. Goal: converge on an approved design — not produce a large document.

## Scopes

- **Product** — philosophy, north star, principles that orient every future decision. Use when starting a new product or redefining its direction. Saves to `docs/product/vision.md`.
- **Component** — module, plugin, integration, or service design. Covers boundaries, interfaces, responsibilities, and tech choices for a delimited part of the system. Conversational — no file saved (feeds architecture-design).
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
   - **Product scope:** read `docs/product/discovery.md` if it exists. If not, proceed from the user's description — note what market context is assumed and flag it as unverified.
   - **Component scope:** read `docs/product/vision.md` (Principles filter the design), `docs/architecture.md`, and any existing code for the component being designed.
   - **Feature scope:** read `docs/product/vision.md` (Principles) and the relevant section of `docs/srs.md` if it exists.
2. Clarify only if a missing piece would materially change the direction. If scope is already clear, skip.
3. If the user pointed to a direction, explore it — don't offer alternatives for completeness. Only present 2–3 options when the decision is genuinely open. For each: what it is, when it works well, main tradeoff, risk. Lead with the recommended option when there is enough signal.
4. Present a design using only the sections that fit the scope (see templates below).
5. Get approval. Revise if needed.
6. Product scope: save to `docs/product/vision.md`. Component and Feature scope: approval is conversational — no file saved.

## Templates

**Feature design** (conversational — not saved to file):

Problem · Core use case · MVP scope · Non-goals · User flow · Risks

**System scope** → `docs/product/vision.md`:

```markdown
# Vision — [Product Name]

## Purpose
The problem worth solving and why this product exists to solve it.
Not a feature list — the reason someone's life is better with this than without it.

## Aspiration
What this product becomes when it's fully realized — the destination that orients every decision today.
Not a roadmap. Not an MVP. The long-term picture that makes trade-offs obvious.

## Users
The specific person this is built for, narrow enough to make real trade-offs.
What they're trying to accomplish, what frustrates them today, what makes them stay.

## Principles
Non-negotiable constraints that filter every product and technical decision.
If a feature or technical choice violates a principle, it does not proceed without explicit justification.
1. **[Principle]** — what it rules out

## Anti-goals
What this product deliberately is not. Keeps principles honest and prevents scope creep.
```

## Done When

Design approved.
- **Product scope** → suggest **srs** to formalize what the system must do.
- **Component scope** → if the design includes data model changes, public API contracts, or irreversible infrastructure decisions, suggest **grill-me** before **architecture-design**. Otherwise suggest **architecture-design** directly. Do not create SRS entries for component-internal design decisions.
- **Feature scope** → if the feature touches auth, data model, or external contracts, suggest **grill-me**. Otherwise suggest **srs** to append the feature requirements.
