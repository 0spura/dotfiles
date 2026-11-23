# Motion, Micro-Interactions & Interactive States

Motion should confirm causality and responsiveness, never delay the user or distract from content. Every interactive view must handle all material states explicitly.

## 1. Purposeful motion

| Interaction | Expected behavior | Timing |
| --- | --- | --- |
| **Buttons & links** | Crisp background/border/ink step on hover; subtle active press (`scale(0.98)` or `1px` press) on click. | `120–160ms ease-out` |
| **Interactive cards / rows** | Subtle border/surface highlight (or `2px` lift on linked cards); image inside linked frame may zoom `1.02` with `overflow: hidden`. | `150–200ms ease-out` |
| **Focus rings** | Immediate visible `:focus-visible` ring (never hidden under sticky headers or clipped by `overflow: hidden`). | `0–100ms` |
| **Overlays (modal, drawer, popover)** | Enter with small opacity + subtle translate/scale (`4–8px`); exit slightly faster than enter. | Enter `180–220ms`, exit `120–150ms` |
| **Loading skeletons** | Quiet pulse/shimmer matching the exact geometry of the loaded content to prevent layout shift (CLS). | Continuous, paused under reduced motion |

### Banned motion
- Scroll-jacking or hijacking native scroll momentum.
- Gratuitous fade-in-on-scroll on every table row, card, or app section.
- 3D card tilt on hover, parallax on readable text, or auto-playing carousels/timed tabs without user control.
- Any infinite animation > 5s on marketing visuals without a pause control.

### Reduced motion (mandatory)
Under `@media (prefers-reduced-motion: reduce)`:
- Disable non-essential transitions, transforms, and continuous loops.
- **Never** leave elements stuck invisible (`opacity: 0`) waiting for a suppressed entrance animation.

## 2. Technical implementation of UI states

Follow `skill://design-principles/SKILL.md` for the UX contract of each state (`loading`, `empty`, `error`, `disabled`, `permission`, `success`). When implementing them in UI code:

- **`loading`**: match skeleton geometry to loaded content to avoid layout shift (CLS); disable submit triggers on pending mutations with an inline spinner and preserved button width to prevent double-submission.
- **`empty`**: separate first-run (value + primary CTA) from filtered zero-results (active filters + *"Clear filters"* action).
- **`error`**: bind inline field errors with `aria-describedby`; preserve all user input on failed submits; include a working retry action on failed fetches.
- **`disabled` / `permission` / `success`**: render a visible explanation for disabled/restricted controls without leaking restricted data; confirm completed mutations with inline updates or non-blocking toasts and clean focus transitions.
