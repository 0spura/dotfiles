---
name: html-slides
description: "Build a single-file HTML slide deck in three light passes, content and mechanics first, then a unique visual identity, then the assembled deck, so revising the sequence never means regenerating the whole file."
disable-model-invocation: true
model: sonnet
effort: medium
---

# HTML Slides

A full deck is an expensive artifact to regenerate, so this skill keeps everything cheap to revise until the last possible moment. Content and identity are decided in short files a human reads in seconds; the HTML itself is written once, from [`assets/template.html`](assets/template.html), the reusable engine, plus [`reference/components.md`](reference/components.md), a catalog of slide layouts, so the model looks up a pattern instead of inventing navigation and animation logic fresh each time. [`scripts/assemble.py`](scripts/assemble.py) turns identity and fragments into the final `deck.html`.

Run the phases in order and get the outline and identity approved before touching HTML.

## Phase 1: Outline

Write the deck as a story before it is a list. A deck is a spoken narrative, the same shape as the ABT and hourglass moves in **academic-writing**: a cover that states the topic, a hook that creates tension, a turn that resolves it, proof that earns the resolution, and a close that returns to the cover's motif. Place every slide in that arc before detailing it. A slide that only reports a fact without moving the story forward is a candidate to cut or merge.

Once the arc holds together, write the content and mechanics as a plain list, one entry per slide, no styling or markup:

- **Message** — the one point this slide makes, the assertion it defends, and what it moves forward from the slide before it.
- **Mechanic** — how it lands: which [`reference/components.md`](reference/components.md) pattern it uses (cover, big-stat hook, comparison, pillars, timeline, phone row, stat card, closing), or a new one worth naming if nothing fits.
- **Speaker note** — the one or two sentences said aloud on this slide, if the deck will be presented live.
- **Image** — only when the slide needs a real photograph, screenshot, or diagram that no CSS or SVG can stand in for; name what it should show. Leave the actual file to the user; Phase 3 builds a labeled placeholder in its place.

Write the title as a lede, not a label: the flat, specific sentence a wire reporter puts first, stating the slide's finding instead of naming its topic (`"Onboarding drop-off concentrates in step 3"`, not `"Onboarding Overview"`). This is the assertion-evidence approach from presentation research at Penn State. Audiences comprehend and recall sentence headlines with supporting visuals better than topic labels with bullet lists. One clause, plain declarative syntax, under ten words where the content allows.

A lede reports; it never performs. The one shape to name and catch is the stage-rhetoric turn a lede would never make, `"it's not X, it's Y"`, the single most recognizable mark of a machine-written title. When a draft reaches for it, swap in the plain claim underneath instead, and vary the sentence shape from title to title the way a person naturally would rather than repeating one scaffold down the deck.

Body text is a lede's supporting paragraph: one idea per slide, generally under 40 words, concrete nouns and numbers carrying the point that an adjective would otherwise only gesture at.

**Done when** the user approves the full list, slide count and order included, since that order becomes the fragment filenames in Phase 3.

## Phase 2: Identity

Fix the deck's look before any slide is coded, and make it specific enough to not read as another generic AI-generated deck. Generic decks share a tell: default gradients, stock icon sets, centered text with no motif, and no recurring visual signature. Name three things:

- **Palette** — background, card, border, foreground, primary, a lighter primary, muted text, one accent, one danger tone. Pick colors that fit the topic's register, not a default blue-purple gradient.
- **Type** — a display font for titles and a body font for text, one pairing, used consistently. `assets/template.html` defaults to Sora and Inter; keep or replace both, but do not mix in a third.
- **Motif** — one recurring visual device unique to this deck, reused across the cover, a mid-deck slide, and the close, so the story's return to the cover at the close reads as earned rather than repeated. The rotating concentric rings and drifting particles are one example from a past deck; the motif should follow this deck's subject rather than reuse that one by default. It stays a supporting device: a slide's title, stat, or takeaway is what the slide is for, and the motif frames that message rather than competing with it.

**Done when** the user approves the palette's hex values, the font pairing, and the motif.

## Phase 3: Build

The deliverable is one file, but never author it as one file: a deck that grows past a handful of slides turns every small edit into rereading and rewriting hundreds of lines, which is the token cost this phase exists to avoid. Author one small fragment per slide instead, and assemble them with a script, not by hand.

In a working directory for this deck, create:

- `deck.json` — the Phase 2 identity as flat keys: `title`, `font_display`, `font_body`, `bg`, `card`, `border`, `sec`, `fg`, `primary`, `primary_light`, `muted`, `accent`, `danger`.
- `slides/NN-slug.html` — one file per outline entry, numbered in order (`01-cover.html`, `02-hook.html`, ...). Each fragment holds exactly what that slide needs and nothing from any other slide:
  - an optional `<!-- note: speaker note text -->` comment,
  - exactly one `<div class="slide ..." id="sN">...</div>` (the first fragment's div carries `class="slide active"`, every other just `class="slide"`),
  - an optional `<style>` block scoped to that slide's own ids and classes,
  - an optional `<script>` block, which becomes that slide's body inside the assembled `runAnim` dispatcher, so write it as the statements to run on reveal, not a full function.

Build each fragment from its outline entry using the assigned `reference/components.md` pattern, writing new markup and CSS only for what the pattern does not already cover, then compose it with a clear visual hierarchy: one element (text, motif, icon, card) draws the eye first, and every other element gets room of its own. Settle any crowding or overlap now, while it's still one small file to look at. That's the cheapest point in the whole pipeline to catch it.

For an outline entry marked with an **Image**, build the [`reference/components.md`](reference/components.md) image placeholder instead: a labeled, dashed-border box sized and positioned exactly as the real image will sit, captioned with what belongs there, so the user knows where to drop the file in later.

Then run `python3 <path-to-skill>/scripts/assemble.py <deck-dir> <path-to-skill>/assets/template.html` to produce `deck.html`. It's the one path from fragments to a finished deck: mechanical text substitution, not something to redo by hand.

Revising later means editing the one fragment that changed and rerunning the same command; no other fragment is touched or re-read.

**Done when** every outline entry has a fragment, the assembler runs clean, the palette and motif from Phase 2 appear consistently in the output, and `deck.html` opens standalone with no missing asset.

## Phase 4: Verify

Dispatch **slides-preview** if a browser MCP tool is installed in this session; it opens `deck.html` in a real browser and reports console errors, viewport overflow, broken reveals, and any slide whose composition reads as cluttered or crowded rather than intentional. Without one, this phase falls back to asking the user to open `deck.html` themselves and click or arrow through every slide, since no static read of the HTML can tell whether it actually renders clean.

## Done When

The deck plays start to finish without console errors, the arc reads start to finish the way Phase 1 planned it, every slide composes cleanly on its own, and the user approves it.
