---
name: design-principles
description: Empirical HCI and UX guidelines per device type to ground UI design decisions.
---

# Design Principles

Empirically-backed defaults. Apply them unless the product context explicitly overrides one with a justified reason.

## Universal

**Cognitive load (Miller's Law):** working memory holds about 7 items (plus or minus 2). Limit menus, option sets, and tab bars to 5 to 9 items (3 to 5 for time-critical tasks). Chunk anything larger.

**Decision time (Hick's Law):** decision time grows logarithmically with choices. For more than 7 or 8 simultaneous options, split into stages or use progressive disclosure.

**Accessibility (WCAG 2.2, all platforms):**
- Keyboard: all functionality operable via Tab, Shift+Tab, Enter, Space, Arrow, Escape (SC 2.1.1).
- Focus order: logical and predictable (SC 2.4.3).
- Focus indicator: visible, at least 3:1 contrast ratio, min 1px perimeter (SC 2.4.7 / 2.4.11).
- Modal dialogs must trap focus and close on Escape.

**Typography:** optimal line length is 50 to 75 characters per line (66 cpl is widely cited as ideal). Never exceed 80 cpl.

## Mobile (smartphone, touch)

**Touch targets:**

| Standard | Minimum | Notes |
|---|---|---|
| Apple HIG | 44x44 pt | Hard floor for iOS |
| Material Design 3 | 48x48 dp (about 9mm) | 8dp min spacing between targets |
| WCAG 2.2 AA | 24x24 px + spacing | AAA: 44x44 px |

**Thumb zone (Hoober, 1,300+ users):** 75% of interactions are single-thumb; 49% one-handed. Place primary CTAs in the bottom 25 to 40%. Put destructive or rare actions in top corners.

**Navigation:** a bottom tab bar is preferred for one-handed reach. Max 5 items before overflow.

## Desktop (mouse + keyboard)

**Click targets (Fitts's Law):** cursor precision is much higher than touch, so there is no hard minimum, but 40x40 px or larger is recommended. Screen edges and corners have effectively infinite target size.

**Hover states:** required for affordance. Indicate clickability and preview consequences before committing.

**Information density:** higher than mobile is appropriate. Margins of 30 to 60 px. Sidebars, multi-column layouts, and complex data tables are viable.

**Navigation:** sidebar or top navigation is preferred. Keyboard shortcuts are expected for power users.

## Web / Responsive

**Breakpoints:**

| Range | Context |
|---|---|
| 320 to 480 px | Mobile portrait |
| 481 to 768 px | Mobile landscape / small tablet |
| 769 to 1024 px | Tablet |
| 1025 to 1200 px | Desktop |
| 1201 px and up | Large desktop |

Use 3 to 5 primary breakpoints. Mobile-first (min-width media queries).
