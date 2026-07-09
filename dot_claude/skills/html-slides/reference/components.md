# Slide Components

A catalog of the recurring slide layouts, keyed by the mechanic they deliver. Look one up when the outline calls for it instead of inventing the CSS and stagger logic from scratch, the way [`template.html`](template.html) is copied instead of retyped. Each entry names its use, the class shape, and its reveal pattern; adapt the numbers and copy to the deck's content and identity, not the structure.

Per-slide `<style>` blocks are appended to the assembled `deck.html` as-is; `assemble.py` only substitutes `__FONT_DISPLAY__`/`__FONT_BODY__` tokens inside `template.html` itself. Where a pattern below sets a font, write the deck's actual display or body font name from `deck.json` (e.g. `'Sora'`), not the token.

## Cover

Use for slide 1. A centered title and subtitle over concentric rotating rings, optionally over a drifting-particle canvas for depth.

```html
<div class="slide active" id="s1">
  <canvas id="p-cv"></canvas>
  <div id="s1-rings"><svg viewBox="0 0 640 640">
    <ellipse class="rg1" cx="320" cy="320" rx="270" ry="125" fill="none" stroke="var(--p)" stroke-width="3" opacity=".5"/>
    <ellipse class="rg2" cx="320" cy="320" rx="210" ry="200" fill="none" stroke="var(--pl)" stroke-width="1.8" opacity=".3"/>
  </svg></div>
  <div id="s1-body"><div id="s1-title">Title</div><div id="s1-sub">Subtitle</div></div>
</div>
```
```css
@keyframes rot1{to{transform:rotate(360deg)}}
@keyframes rot2{to{transform:rotate(-360deg)}}
.rg1{transform-origin:320px 320px;animation:rot1 20s linear infinite}
.rg2{transform-origin:320px 320px;animation:rot2 32s linear infinite}
#s1-body{opacity:0;transform:translateY(20px);transition:opacity .9s ease,transform .9s ease}
```
Reveal: in `runAnim`, on the cover's index, set `#s1-body`'s opacity to 1 and transform to none.

## Big-stat hook

Use to open with one number the audience must feel, often counting down or up, then a punch line underneath. Read as tension, the "but" of the ABT shape.

```html
<div id="s-num">47</div>
<div id="slines"><div class="sline" id="sl1">First line.</div><div class="sline" id="sl2">Second line.</div></div>
```
```css
#s-num{font-family:'Sora',sans-serif;font-size:8.5rem;font-weight:800;color:var(--p);line-height:1}
.sline{opacity:0;transform:translateY(16px);transition:all .5s ease}
.sline.vis{opacity:1;transform:translateY(0)}
```
Reveal: animate the number toward its target with `setTimeout` ticks that slow down as they approach (fast at first, slow near the end reads as deliberate, not jittery), then stagger `.vis` onto each `.sline` about 500ms apart.

## Comparison, two panels

Use to contrast a before/after, us/them, or old/new. Danger tone on the left, primary tone on the right, or reverse to match the argument.

```html
<div style="display:flex;gap:56px;">
  <div class="panel bad"><div class="p-ttl">Old way</div><div class="p-desc">…</div></div>
  <div class="vs-div">vs</div>
  <div class="panel good"><div class="p-ttl">New way</div><div class="p-desc">…</div></div>
</div>
```
```css
.panel{flex:1;padding:36px 28px;border-radius:20px;display:flex;flex-direction:column;align-items:center;gap:16px}
.panel.bad{background:color-mix(in srgb, var(--danger) 7%, transparent);border:1px solid color-mix(in srgb, var(--danger) 20%, transparent)}
.panel.good{background:color-mix(in srgb, var(--p) 7%, transparent);border:1px solid color-mix(in srgb, var(--p) 20%, transparent)}
```
No reveal needed unless the deck's motif stages one side in after the other.

## Pillars, three columns

Use for three parallel principles or pillars of equal weight, each with an icon, a title, and one line of support.

```html
<div style="display:flex;gap:32px;">
  <div class="pillar" id="pil1"><svg class="lucide pil-ico">…</svg><div class="pil-ttl">Name</div><div class="pil-desc">…</div></div>
</div>
```
```css
.pillar{flex:1;padding:36px 28px;border-radius:20px;background:var(--card);border:1px solid var(--border);box-shadow:var(--shadow);opacity:0;transform:translateY(24px);transition:all .6s ease}
.pillar.vis{opacity:1;transform:translateY(0)}
```
Reveal: stagger `.vis` onto `pil1`, `pil2`, `pil3` about 200ms apart.

## Anchor timeline

Use for a sequence of steps or milestones along a horizontal spine, each node revealing a chip beneath it.

```html
<div id="atl"><div id="tspine"><div id="tprog"></div></div>
  <div id="anc-nodes"><div class="anc-n" id="an1"><div class="a-dot">1</div><div class="a-name">Step</div></div></div>
</div>
```
```css
#tspine{position:relative;height:3px;background:var(--border);border-radius:2px}
#tprog{height:100%;background:linear-gradient(90deg,var(--p),var(--accent));width:0%;transition:width 1.6s ease}
.anc-n{opacity:0;transform:translateY(14px);transition:all .5s ease}
.anc-n.vis{opacity:1;transform:translateY(0)}
```
Reveal: stagger `.vis` onto each node about 360ms apart, growing `#tprog`'s width in step with the last revealed node.

## Phone mockup row

Use to show product screens side by side, the center one often raised and highlighted as the focal state.

```html
<div style="display:flex;align-items:flex-end;gap:28px;">
  <div class="ph"><div class="pnotch"></div><div class="pscreen">…</div></div>
  <div class="ph mid"><div class="pnotch"></div><div class="pscreen">…</div></div>
</div>
```
```css
.ph{width:200px;height:380px;border-radius:30px;background:var(--card);border:1.5px solid var(--border);opacity:0;transform:translateY(56px);transition:all .6s cubic-bezier(.34,1.56,.64,1)}
.ph.vis{opacity:1;transform:translateY(0)}
.ph.mid{width:220px;height:420px;border-color:var(--p)}
.ph.mid.vis{transform:translateY(-14px)}
```
Reveal: stagger `.vis` onto each phone, left to right.

## Stat card

Use for a single dense card of two or three metrics, appearing together with each bar filling to its value.

```html
<div class="card" id="stats-card"><div class="stat-row"><span>Label</span><div class="bar"><div class="bar-fill" id="smf1" style="width:0"></div></div></div></div>
```
```css
#stats-card{opacity:0;transition:opacity .5s ease}
#stats-card.vis{opacity:1}
.bar{height:8px;background:var(--sec);border-radius:4px;overflow:hidden}
.bar-fill{height:100%;background:var(--p);transition:width 1s ease}
```
Reveal: show the card, then after a short delay set each `.bar-fill`'s width to its target percentage.

## Closing

Use for the last slide. The identity's cover motif recurring (rings, particles) signals the deck came full circle, with a one-line takeaway and credits.

Reuse the cover's ring markup under a different id, with the takeaway line replacing the title.

## Image placeholder

Use wherever an outline entry names a real photograph, screenshot, or diagram no CSS or SVG can stand in for. Size and position the box as the real image will sit, so dropping the file in later changes nothing else on the slide.

```html
<div class="img-ph"><span class="img-ph-lbl">Screenshot: checkout flow, step 3</span></div>
```
```css
.img-ph{width:100%;max-width:640px;aspect-ratio:16/10;border:2px dashed var(--border);border-radius:16px;display:flex;align-items:center;justify-content:center;padding:24px;background:color-mix(in srgb, var(--card) 60%, transparent)}
.img-ph-lbl{font-family:'Sora',sans-serif;font-size:1rem;color:var(--muted);text-align:center}
```
No reveal needed unless the slide's other elements stagger in around it.
