---
name: brainstorming
description: Explore and converge on an approved product, component, or feature design before requirements or implementation. Use when direction is undecided; not to generate code.
---

# Brainstorming

Choose one scope: product, module, or feature. Read the existing evidence before asking what it already answers, and ask only questions that can change the direction. Write no production code, API schema, estimate, or implementation plan here.

## Workflow

1. Use the canonical issue and linked discovery from `plan` as the problem boundary. Carry its target project, affected users, constraints, success signal, and non-goals through the design; surface a contradiction before changing the issue's outcome.
2. Produce alternatives only for a real choice, comparing expected outcome, evidence, tradeoffs, risks, and reversibility.
3. Recommend one option and name the assumption that could invalidate it.
4. Ask for approval before saving the design or moving to requirements. The parent links the approved artifact and any unresolved decision on the same workctl issue, then reads it back; a saved design is not implementation authorization.
5. Route irreversible data, API, infrastructure, security, or scale choices through `grill-me`, and technical design through `architecture-design`, retaining issue identity and approved scope instead of creating tickets per phase.

- **Product:** draft purpose, aspiration, users, principles, and anti-goals with `skill://brainstorming/reference/vision-template.md`; save `docs/product/vision.md` after approval.
- **Component:** problem, boundaries, interfaces, responsibilities, technical choices, and risks.
- **Feature:** problem, core use case, MVP, non-goals, user flow, and risks; route a material UI flow to the `design` agent, which owns `design-principles`.

## Done when

The design is approved, or the decision blocking it is explicit, with the next phase named.
