---
name: design-principles
description: Design or review a user-facing flow from accepted requirements, enforcing explicit state coverage, accessibility, cognitive-load discipline, and responsive behavior. Use for UX flow and interaction specs; use frontend-craft for UI implementation.
---

# Design Principles

Turn accepted requirements into an explicit, accessible, responsive user flow. This skill owns **interaction flow and state completeness**; it writes no UI code (hand UI implementation to `frontend-craft`).

## House rules

1. **Requirements win over defaults.** Defaults here guide layout and interaction, never override accepted requirements or user evidence.
2. **No implied states.** Every material UI state must have an explicit entry, user feedback, and recovery/exit path.
3. **Accessibility is baseline.** Keyboard navigation, screen-reader semantics, focus management, touch targets, and narrow-screen reflow are non-negotiable.
4. **Never invent product behavior.** Return ambiguous rules or missing product decisions as explicit questions.
5. **Visual polish is not usability.** Name observable success evidence a reviewer or user can verify.

## Required state matrix

Cover every state that materially applies to the flow (omit with reason only if impossible):

| State | Must specify |
| --- | --- |
| `loading` | Trigger, indicator, whether interaction locks, timeout/cancel path. |
| `empty` | First-run vs zero-results distinction, next actionable step. |
| `error` | Inline vs banner placement, plain-language cause, retry/recovery action preserving user input. |
| `disabled` | Why unavailable and what unblocks it (never a silent dead control). |
| `permission` | Missing role/scope handling without leaking restricted data. |
| `success` | Confirmation feedback, resulting state/destination, undo if destructive. |

## Accessibility & responsive baseline

- **Keyboard & focus:** Logical Tab order, visible focus ring, focus moved intentionally on modal/route/error transitions, Escape closes overlays.
- **Semantics:** Native controls over clickable `<div>`, visible labels, single-level heading progression, `aria-live` for async status changes.
- **Touch & narrow screens:** Primary actions reachable without horizontal scroll; tap targets ≥ 44×44 px with adequate spacing; progressive disclosure for secondary details.

## Workflow

1. **Anchor to requirements.** Identify the primary user goal, entry point, and requirement IDs satisfied (reference IDs instead of restating them).
2. **Map the primary flow.** Entry state → user action → system feedback → completion/recovery path.
3. **Fill the state matrix.** Make every material non-happy-path state explicit.
4. **Audit accessibility & narrow viewports.** Flag concrete WCAG or platform risks.
5. **Define observable evidence.** State what a reviewer or usability check must observe to accept the flow.

## Checklist

- [ ] Primary user goal, entry, actions, feedback, and recovery are explicit.
- [ ] All material states from the matrix are covered.
- [ ] Keyboard, screen-reader, focus, touch, and narrow-screen behavior specified.
- [ ] Requirement IDs referenced; every ambiguity returned as an open question.

## Never

- Implement UI code inside a design-only task.
- Silently fill missing product rules or edge-case policies.
- Rely on color alone, hover-only interactions, or unlabeled icons for critical actions.
- Treat aesthetic polish as proof that a flow is usable.

## Output

Target users & context, primary flow, state matrix, accessibility/responsive decisions & risks, requirement references, observable success evidence, and open product questions.
