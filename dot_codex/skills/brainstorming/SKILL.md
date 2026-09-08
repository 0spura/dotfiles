---
name: brainstorming
description: Explore and converge on an approved product, component, or feature design before requirements or implementation. Use when direction is undecided, not to generate code.
---

# Brainstorming

Choose one scope: product, module, or feature. Read the active issue and
existing evidence before asking what it already answers. Design is separate
work only when it is independently requested or blocks other items. Separate
facts, assumptions, and unknowns; ask only questions that can change the
direction.

## Workflow

1. State the problem, affected users, scale/context, constraints, success signal, and non-goals.
2. Produce alternatives only for a real choice. Compare expected outcome, evidence, tradeoffs, risks, and reversibility.
3. Recommend one option and identify the assumptions that could invalidate it.
4. Ask for approval before saving an approved design or moving to requirements.

- **Product:** read discovery; draft purpose, aspiration, users, principles, and anti-goals. Use [reference/vision-template.md](reference/vision-template.md) and save `docs/product/vision.md` only after approval.
- **Component:** define problem, boundaries, interfaces, responsibilities, technical choices, and risks. Do not edit source.
- **Feature:** define problem, core use case, MVP, non-goals, user flow, and risks. Route UI flows to `ux-design` when material.

Route irreversible data, API, infrastructure, security, or scale choices through `grill-me` before architecture.

Do not write production code, detailed API schemas, estimates, or implementation plans in this phase.

Record the approved design or unresolved decision in the tracker. Return the
next phase and unresolved decisions.
