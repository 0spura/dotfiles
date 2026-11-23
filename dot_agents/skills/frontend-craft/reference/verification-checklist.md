# Frontend Verification Gate

Run build/typecheck first, then verify the rendered UI in a real browser whenever a dev server or browser tool is available. Report only checks actually executed and observed.

## 1. Static & build checks
- [ ] Typecheck (`tsc --noEmit` or stack equivalent) passes with zero errors on touched files.
- [ ] Production build succeeds cleanly with no broken asset imports or CSS syntax errors.
- [ ] Component/unit tests for changed interactive logic (especially error/empty/boundary states) pass.

## 2. Viewport matrix

Inspect at minimum **Desktop (`1440×900`)** and **Mobile (`390×844`)** — add **Tablet (`768×1024`)** and **Narrow (`320px`)** for complex layouts or critical checkout/auth flows:

| Check | Pass criterion |
| --- | --- |
| **No horizontal overflow** | `document.documentElement.scrollWidth <= window.innerWidth` at every tested width. |
| **No clipping or collision** | Zero overlapping text/buttons, nothing cut off under fixed headers/footers/mobile bars. |
| **Above-the-fold clarity** | Primary heading and primary action visible without hunting; no broken empty voids. |
| **Responsive reflow** | Multi-column grids stack cleanly at `390px`; tables scroll cleanly inside their own container (never breaking page width) or adapt to cards. |
| **Touch targets** | Interactive controls outside running text are ≥ `44×44 px` on mobile with adequate spacing (≥ `8px`). |

## 3. Runtime, media & visual integrity
- [ ] **Zero console / hydration errors** and zero failed network requests for local assets/fonts/icons.
- [ ] **Every visual renders:** all `<img>` loaded (`complete && naturalWidth > 0`) with meaningful `alt` (or `alt=""` if purely decorative); no broken SVG/icon boxes.
- [ ] **Fonts & contrast:** intended web fonts loaded; text and interactive controls readable in both light and dark modes (if supported).

## 4. Accessibility & keyboard walk
- [ ] **Tab walk:** `Tab` moves in logical visual order; `:focus-visible` ring is clearly visible and never obscured by sticky bars.
- [ ] **Overlays:** opening a modal/drawer moves focus inside; `Escape` closes it and returns focus to the trigger.
- [ ] **Semantics:** buttons are `<button>`, links are `<a href>`, inputs have programmatic `<label>`s, headings progress one level at a time (`h1` → `h2` → `h3`), no `tabIndex > 0`.
- [ ] **States exercised:** verify `loading`, `empty`, `error` (with retry/preserved input), and `success` paths rather than only the populated happy path.
