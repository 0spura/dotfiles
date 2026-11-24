# Visual System: Color, Typography & Layout

Concrete visual rules to keep interfaces crisp, cohesive, and free of generic AI templates. Project design tokens always take precedence over defaults here.

## 1. Color & surface discipline

- **Neutral dominance (60 / 30 / 10):** Most of the screen is calm neutral surfaces (`bg`, subtle `surface`, crisp `border`), not competing colored blocks.
- **One primary accent:** Reserve the brand accent for primary CTAs, active navigation, and focus rings. Use semantic colors strictly for meaning (`success`, `warning`, `destructive`, `info`).
- **Elevation without muddy shadows:**
  - Light mode: subtle borders (`1px solid`) + light surface steps; soft shadows only on floating layers (popovers, modals, dropdowns).
  - Dark mode: **stepped surface lightness + crisp low-opacity borders** instead of blurry drop shadows; avoid pure `#000000` paired with harsh `#FFFFFF` text (use slightly softened off-white/slate inks).
- **Contrast floors (WCAG AA):** ≥ `4.5:1` for normal body text, ≥ `3:1` for large headings (≥ 18px bold / 24px regular) and interactive controls/borders.

### Banned visual clichés
- Default purple/violet/indigo-to-pink gradients as brand identity (unless explicitly part of the client's brand).
- Neon outer glows, animated mesh backgrounds, or decorative floating blobs behind app content.
- Glassmorphism (`backdrop-blur`) stacked on noisy backgrounds where text contrast degrades.
- Rainbow badge explosions (every tag a different saturated pastel) — use neutral badges by default and color only for meaningful status.

## 2. Typography & rhythm

- **Restrained pairing:** One clean sans-serif for UI/headings + one monospace for code, IDs, tokens, hashes, and timestamps. Add a display/serif face only for intentional editorial/marketing pages.
- **Numeric alignment:** Always apply `font-variant-numeric: tabular-nums` (`tabular-nums`) to tables, counters, prices, percentages, and timestamps so digits align vertically and never jitter on updates.
- **Hierarchy by weight + size + ink (not all caps everywhere):**
  - Clear step between page title, section heading, card title, body (`14–16px`), and muted metadata (`12–13px`).
  - Tighter tracking (`-0.02em`) and line-height (`1.1–1.25`) on large display headings; comfortable line-height (`1.5–1.6`) on body copy.
- **Measure:** Cap running prose at `60–75ch` so lines stay scannable.
- **Spacing scale:** Stick to a consistent `4px` / `8px` grid; give related elements tighter gaps than unrelated groups (proximity rule).
- **Radius consistency:** Pick one radius family (`sharp` for dev tools/fintech, `soft` for general SaaS, `round` for consumer) and scale nested elements cleanly (`outerRadius = innerRadius + padding`). Never mix sharp inputs with pill cards and square buttons on the same screen.

## 3. Layout & density

- **Equal content edges:** Every section and block aligns to the same container grid/edges; nothing randomly bleeds to only one side.
- **Nesting cap:** Maximum **2 visual container levels** deep (page → panel/card → content). Never put bordered cards inside bordered cards inside bordered cards.
- **App / Dashboard patterns:**
  - Put the primary page title + primary action in one predictable header bar.
  - Keep tables scannable: left-align text, right-align numbers, truncate long IDs with copy button + tooltip, keep row actions consistent.
  - Use side drawers or dedicated routes for complex create/edit forms instead of cramped modals.
- **Landing / Product page patterns:**
  - Hero occupies the first screen cleanly with value proposition, one concrete fact, primary CTA, and real product UI or real photography (never an abstract geometric placeholder).
  - One clear idea per section; alternate layout compositions instead of repeating identical 3-column icon cards down the entire page.
