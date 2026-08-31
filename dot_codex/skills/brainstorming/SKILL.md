---
name: brainstorming
description: Explore and converge on an approved product, component, or feature design before requirements or implementation. Use when direction is undecided, not to generate code.
---

# Brainstorming

Choose one scope: product, component, or feature. Read the repository and existing product documents before asking what they already answer. Ask only questions whose answers materially change the direction.

## Workflow

1. State the problem, users, constraints, success signal, and explicit non-goals.
2. Produce 2–3 genuinely different options only when the direction is open. Compare shape, benefits, tradeoffs, risks, and fit with existing principles.
3. Recommend one option and identify decisions that are expensive to reverse.
4. Ask for approval before saving an approved design or moving to requirements.

- **Product:** read discovery; draft purpose, aspiration, users, principles, and anti-goals. Use [reference/vision-template.md](reference/vision-template.md) and save `docs/product/vision.md` only after approval.
- **Component:** define problem, boundaries, interfaces, responsibilities, technical choices, and risks. Do not edit source.
- **Feature:** define problem, core use case, MVP, non-goals, user flow, and risks. Route UI flows to `ux-design` when material.

Use 2–3 options only for a genuinely open decision. Recommend one with its tradeoff. Route irreversible data, API, infrastructure, or security choices through `grill-me` before architecture.

Do not write production code, detailed API schemas, estimates, or implementation plans in this phase.

Return the next phase and unresolved decisions.
