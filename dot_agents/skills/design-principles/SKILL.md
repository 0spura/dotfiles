---
name: design-principles
description: Design or review a user-facing flow from accepted requirements, applying accessibility, cognitive-load, responsive-layout, and state-coverage defaults.
---

# Design Principles

The flow is designed from accepted requirements and current evidence; the defaults below are not evidence about users, and not a substitute for requirements or accessibility standards. A design-only task implements no UI.

## Workflow

1. Name the primary user goal and the flow that reaches it: entry state, next action, feedback, and recovery path.
2. Cover only the material states — loading, empty, error, disabled, permission, success — and how each is reached and left.
3. Preserve keyboard, screen-reader, focus, touch, and narrow-screen operation; apply current WCAG and platform requirements where they govern.
4. Reference the requirements the flow satisfies instead of restating them, and return an ambiguity as a question rather than inventing product behavior.
5. Name the success evidence a reviewer can observe.

## Defaults

- Keep choices and information proportional to the task; disclose secondary detail progressively.
- Make every state explicit rather than implied by the happy path.
- Validate important flows with representative users or an observable proxy; visual polish is not usability evidence.

## Done when

The flow, its states, its accessibility and responsive decisions, and the requirement references are explicit, with open questions returned rather than filled.

## Output

Target users and context, the primary flow, the evidence behind it, accessibility risks, and unresolved product decisions.
