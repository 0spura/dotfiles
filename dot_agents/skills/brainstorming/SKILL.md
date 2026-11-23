---
name: brainstorming
description: Explore and converge on an approved product, component, or feature direction before requirements or implementation. Use when direction is undecided; never to generate code or implementation plans.
---

# Brainstorming

Converge on one approved direction by comparing real tradeoffs — without prematurely writing code, schemas, or plans.

## House rules

1. **One scope per session.** Pick exactly one: `Product`, `Component`, or `Feature`.
2. **Read before asking.** Check existing code, docs, and discovery evidence first; ask only questions whose answer changes the direction.
3. **Real alternatives only.** Present alternatives only where a genuine tradeoff exists — never pad with strawmen.
4. **One recommendation + kill switch.** Always recommend one option and explicitly name the assumption that would invalidate it.
5. **Approval before advancing.** Never move to requirements, architecture, or code until the user approves the chosen direction.

## Scope outputs

| Scope | What to produce | Next routing |
| --- | --- | --- |
| **Product** | Purpose, aspiration, target users, principles, anti-goals (`skill://brainstorming/reference/vision-template.md`); save `docs/product/vision.md` after approval. | `srs` / `design-principles` |
| **Component** | Problem, boundaries, interfaces, responsibilities, technical choices, risks. | `architecture-design` |
| **Feature** | Problem, core use case, MVP, non-goals, high-level user flow, risks. | Route material UI flows to `design-principles`; UI builds to `frontend-craft`; irreversible choices to `grill-me`. |

## Workflow

1. **Frame the boundary.** State target project, affected users, constraints, success signal, and non-goals from existing evidence.
2. **Compare real options.** Contrast expected outcome, evidence, tradeoffs, risks, and reversibility.
3. **Recommend one option.** State why it wins and the exact assumption that would flip the recommendation.
4. **Get explicit approval.** Return the proposed direction and any blocking decision; route irreversible data/API/infra/security choices to `grill-me` and technical structure to `architecture-design`.

## Checklist

- [ ] Scope (`Product`, `Component`, or `Feature`) is explicit and bounded.
- [ ] Every alternative is viable with honest tradeoffs and reversibility noted.
- [ ] One option recommended with its invalidating assumption named.
- [ ] Explicit approval requested before saving durable docs or starting the next phase.

## Never

- Write production code, API schemas, effort estimates, or step-by-step implementation plans here.
- Ask questions already answered by the repository or discovery docs.
- Invent strawman options just to make a recommendation look obvious.

## Output

Chosen scope, tradeoffs, single recommendation with invalidating assumption, blocking decisions, and recommended next phase.
