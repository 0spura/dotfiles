---
name: design-principles
description: Empirical HCI and UX guidelines per device type to ground UI design decisions. Preloaded into the ui-design agent; do not invoke directly.
disable-model-invocation: true
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

---

## Mobile (smartphone, touch)

**Touch targets:**

| Standard | Minimum | Notes |
|---|---|---|
| Apple HIG | 44x44 pt | Hard floor for iOS |
| Material Design 3 | 48x48 dp (about 9mm) | 8dp min spacing between targets |
| WCAG 2.2 AA | 24x24 px + spacing | AAA: 44x44 px |

**Thumb zone (Hoober, 1,300+ users):** 75% of interactions are single-thumb; 49% one-handed.

| Zone | Location | Accuracy | Speed |
|---|---|---|---|
| Green | Bottom 25 to 40% | 96% | Baseline |
| Yellow | Mid-sides | Reduced | 30 to 50% slower |
| Red | Top corners | Lowest | 60 to 80% slower |

Place primary CTAs in the green zone. Put destructive or rare actions in red.

**Navigation:** a bottom tab bar is preferred for one-handed reach. Max 5 items (Apple HIG) before overflow. Swipe-back is expected on iOS.

---

## Tablet

Touch target minimums are the same as mobile (44x44 pt / 48x48 dp). Increase spacing to 24 to 32dp where space allows.

**Orientation:**
- Portrait: single-column or 30:60 split view.
- Landscape: 50:50, 25:75, or 75:25 split view for multitasking.

**Multi-pane:** position primary actions for thumb and index-finger reach, since bimanual use is common. Maintain layout priority during orientation changes to avoid context-switching disorientation between panes.

Larger screen area permits higher density than mobile without sacrificing reachability. Design tablet-specific layouts rather than scaling phone layouts when content complexity warrants it.

---

## Desktop (mouse + keyboard)

**Click targets (Fitts's Law, mouse):** cursor precision is much higher than touch, so there is no hard minimum, but 40x40 px or larger is recommended for ergonomics. Screen edges and corners have an effectively infinite target size because the cursor stops at the boundary; use them for frequently-accessed controls.

**Hover states:** required for affordance. Indicate clickability and preview consequences before committing. Never use hover as the only signal for important information.

**Information density:** higher than mobile is appropriate. Margins of 30 to 60 px (versus 16 to 24 px on mobile). Sidebars, multi-column layouts, and complex data tables are viable. Smaller type is acceptable while maintaining readability.

**Navigation:** sidebar or top navigation is preferred. Keyboard shortcuts are expected for power users.

---

## Web / Responsive

**Breakpoints (industry standard 2025 to 2026):**

| Range | Context |
|---|---|
| 320 to 480 px | Mobile portrait |
| 481 to 768 px | Mobile landscape / small tablet |
| 769 to 1024 px | Tablet |
| 1025 to 1200 px | Desktop |
| 1201 px and up | Large desktop |

Use 3 to 5 primary breakpoints. Mobile-first (min-width media queries).

**Approach:** responsive for content-driven layouts; adaptive for interaction-driven layouts where device context changes behavior significantly, not just size.

---

## When to look up platform specifics

Use `WebSearch` or `WebFetch` for decisions that depend on current platform details:
- Component-level patterns (bottom sheets, navigation bars, swipe conventions).
- OS-version-specific behavior (iOS 18+, Android 15+, new WCAG criteria).
- Platform-mandated flows (App Store review requirements, accessibility audits).
