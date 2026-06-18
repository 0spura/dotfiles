---
name: brainstorming
description: "Use before building a feature or defining a system: explore workflows, module boundaries, tech direction, edge cases, and behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
---

# Brainstorming

Use when exploring how something should work before building it. Goal: converge on an approved design — not produce a large document.

## Scopes

- **System** — overall architecture, module boundaries, tech stack, cross-cutting concerns. Use when starting a new product or making a large structural decision. Saves to `docs/product/vision-and-strategy.md`.
- **Feature** — how a specific feature or integration should work. Ends with conversational approval — no file saved.

## Constraints

- If no product context exists yet (competitors, market position, ICP), suggest **product-discovery** first.
- No implementation, code scaffolding, or file edits during brainstorming.
- Stay within the stated scope. Do not expand the problem or surface adjacent concerns unless asked.
- One question at a time. Use multiple-choice when it helps.
- Inspect the repo before asking questions the code already answers.

## Process

1. Read relevant code, docs, and existing patterns. For system scope, read `docs/product/discovery.md` if it exists.
2. Clarify only if a missing piece would materially change the direction. If scope is already clear, skip.
3. If the user pointed to a direction, explore it — don't offer alternatives for completeness. Only present 2–3 options when the decision is genuinely open. For each: what it is, when it works well, main tradeoff, risk. Lead with the recommended option when there is enough signal.
4. Present a design using only the sections that fit the scope (see templates below).
5. Get approval. Revise if needed.
6. System scope: save the approved design to `docs/product/vision-and-strategy.md`. Feature scope: approval is conversational — no file saved.

## Templates

**Feature design** (conversational — not saved to file):

Problem · Core use case · MVP scope · Non-goals · User flow · Risks

**System scope** → `docs/product/vision-and-strategy.md`:

```markdown
# Vision and Strategy — [Product Name]

## Vision
What this system is and what problem it solves at the macro level.

## Modules
The main parts of the system, what each owns, and how they relate.

## Tech Direction
Language, framework, database, infra — and why. High-level only; details go in docs/project.md.

## Cross-Cutting Concerns
Auth strategy, API style, observability approach.

## Features
Which features the system includes and which module owns each one.

## Principles
Non-negotiable architectural constraints that every decision must respect.

## Open Questions
Decisions not yet made that will materially affect the system shape.
```

## Done When

Design approved.
- System scope → suggest **srs** to formalize the system requirements.
- Feature scope → suggest **srs** to add the feature requirements to `docs/srs.md`.
