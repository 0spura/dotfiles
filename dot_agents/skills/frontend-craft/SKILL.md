---
name: frontend-craft
description: Build, redesign, or polish web UI — both interactive Web Apps/Dashboards/SaaS and landing/product pages — with anti-slop visual craft, design-system reuse, sharp microcopy, complete interactive states, accessibility, and real-browser verification.
---

# Frontend Craft

Build interfaces that look engineered by a strong product team (Linear, Stripe, Figma, Vercel bar) — never generic AI templates. Reuse the project's existing stack and design system, enforce sharp visual hierarchy, cover every interactive state, and verify the rendered UI across desktop and mobile viewports.

## References (read before designing or auditing the matching layer)

| Layer | Reference | Read when |
| --- | --- | --- |
| **Visual system, palette, type, layout** | `skill://frontend-craft/reference/visual-system.md` | Starting any new page/screen, redesign, or theme/layout work |
| **Copy, UI microcopy & anti-slop words** | `skill://frontend-craft/reference/copy-and-microcopy.md` | Writing headings, buttons, empty/error states, or landing copy |
| **Motion, micro-interactions & states** | `skill://frontend-craft/reference/motion-and-states.md` | Building interactive flows, forms, tables, modals, or animations |
| **Browser, a11y & responsive gate** | `skill://frontend-craft/reference/verification-checklist.md` | Verifying any built or modified UI before reporting done |

## House rules

1. **Reuse the design system first.** Use the project's existing UI primitives, tokens, CSS variables, and component library before writing bespoke components or arbitrary CSS values.
2. **One cohesive visual system.** One type scale, one spacing/radius scale, one primary button style, one card style, and one restrained palette (dominant neutral surface + one purposeful accent + semantic status colors).
3. **Zero AI-slop aesthetics.** Never default to purple/violet gradients, neon glows, glassmorphism soup, nested cards (> 2 levels deep), decorative blobs, or emoji/generic icons in place of real UI/icons.
4. **Explicit states on every interactive view.** Every data-driven or form view handles `loading`, `empty`, `error`, `disabled`, `permission`, and `success` explicitly — never leave only the happy path.
5. **Plain, concrete copy.** Headings name real things; buttons use **verb + object** (*"Create token"*, *"Revoke key"*); zero AI-slop buzzwords (*"seamless"*, *"empower"*, *"revolutionize"*, *"elevate"*).
6. **Accessible & responsive by default.** Semantic HTML, logical keyboard Tab order, visible focus rings, WCAG AA contrast, ≥ 44×44 px touch targets on mobile, zero horizontal overflow down to 390px (and 320px on critical flows).
7. **Purposeful motion only.** Subtle hover/press feedback and crisp state transitions (`150–250ms`); always respect `prefers-reduced-motion`; zero scroll-jacking, card tilt, or gratuitous fade-in-on-scroll on app rows/cards.

## Surface routing

| Surface | Primary focus |
| --- | --- |
| **Web App / Dashboard / SaaS** | Scannable information density, clear data hierarchy, `tabular-nums` on metrics/tables, layout-matched skeletons, inline validation preserving input, keyboard ergonomics, zero decorative clutter. |
| **Landing / Product / Marketing** | Single-focus above-the-fold hero (what it is, for whom, one hard fact, ≤ 2 actions), real product UI or real photography (never drawn look-alike logos or empty boxes), equal left/right content edges, balanced section rhythm. |

## Workflow

1. **Inspect existing UI conventions.** Read the project's theme/tokens (`tailwind.config.*`, CSS variables, UI primitives, existing views) so new UI belongs to the same system.
2. **Load matching references.** Read the relevant `reference/*.md` files above for visual system, copy, and states/motion.
3. **Plan hierarchy & states before coding.** Define the primary action per screen/panel, component boundaries (split cohesive sub-components; never create God components), and every material state.
4. **Implement cleanly.** Compose from existing primitives; keep presentation separate from API/business logic; enforce semantic HTML and token usage.
5. **Run the verification gate.** Execute build/typecheck/tests, then run through `reference/verification-checklist.md` in a real browser (when a dev server or browser tool is available) across desktop (`1440px`) and mobile (`390px`).

## Never

- Invent fake metrics, testimonials, customer logos, or leave "Lorem ipsum" / "Test 123" in shipped UI.
- Use clickable `<div>`s instead of `<button>` / `<a>`, or rely on color alone / hover-only tooltips for critical state.
- Bypass design tokens with scattered hardcoded hex colors, magic pixel offsets, or mixed border-radius scales.
- Add heavy animation libraries, auto-playing carousels, parallax text, or scroll-linked fades on app tables/cards.

## Output

Summary of UI changes, existing primitives/tokens reused, states covered, and verification results (build/typecheck + viewports/checks observed).
