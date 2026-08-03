---
name: design-principles
description: Apply practical accessibility, cognitive-load, responsive-layout, and device-specific UX defaults when designing user interfaces or interaction flows.
---

# Design Principles

Use these principles when designing or reviewing a user-facing interface or interaction flow. They are defaults, not a substitute for product requirements, user research, or platform accessibility requirements.

- Keep simultaneous choices within working-memory limits. Use chunking and progressive disclosure for large sets.
- Meet WCAG 2.2 keyboard, focus-order, focus-visible, and modal-focus requirements. Do not use hover as the only signal.
- Target 50–75 characters per text line. Make visual hierarchy and state changes explicit.
- On touch screens, use at least 44×44 pt or 48×48 dp targets and place frequent primary actions in thumb-reachable zones.
- On desktop, support keyboard shortcuts, visible hover affordances, denser layouts when they remain legible, and ergonomic click targets.
- Use mobile-first responsive layouts. Change interaction patterns adaptively only when device context, not merely width, changes.

Check current platform-specific behavior or standards with authoritative web sources when the decision depends on a particular OS, browser, or WCAG update.

Return the target users, primary flow, responsive states, accessibility risks, and unresolved product decisions. Do not implement UI during a design-only task.

Use the user's vocabulary rather than internal system terms. Show the primary action and current state clearly, progressively disclose secondary detail, preserve keyboard and screen-reader operation, and define empty, loading, error, disabled, focus, hover, touch, and narrow-screen states.
