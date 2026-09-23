---
name: brainstorming
description: Explore and converge on an approved product, component, or feature design before requirements or implementation. Use when direction is undecided; not to generate code.
---

# Brainstorming

Choose one scope: product, module, or feature. Read the existing evidence before asking what it already answers, and ask only questions that can change the direction. Write no production code, API schema, estimate, or implementation plan here.

## Workflow

1. State the problem, affected users, scale and context, constraints, success signal, and non-goals.
2. Produce alternatives only for a real choice, comparing expected outcome, evidence, tradeoffs, risks, and reversibility.
3. Recommend one option and name the assumption that could invalidate it.
4. Ask for approval before saving the design or moving to requirements.
5. Route irreversible data, API, infrastructure, security, or scale choices through `grill-me`, and technical design through `architecture-design`.

- **Product:** draft purpose, aspiration, users, principles, and anti-goals with `skill://brainstorming/reference/vision-template.md`; save `docs/product/vision.md` after approval.
- **Component:** problem, boundaries, interfaces, responsibilities, technical choices, and risks.
- **Feature:** problem, core use case, MVP, non-goals, user flow, and risks; route a material UI flow to the `design` agent, which owns `design-principles`.

## Done when

The design is approved, or the decision blocking it is explicit, with the next phase named.
