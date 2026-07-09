#!/usr/bin/env python3
"""Assemble a deck.html from template.html, deck.json, and slides/*.html.

Deterministic text substitution, not model generation, so growing a deck to
dozens of slides never costs more tokens to assemble; editing one slide only
touches its fragment file, then this script rebuilds the single-file output.

Usage: assemble.py <deck_dir> <template.html> [output.html]
  <deck_dir> holds deck.json and a slides/ subfolder of NN-slug.html fragments.
  Each fragment has, in any order: an optional leading "<!-- note: ... -->"
  comment, exactly one <div class="slide" ...>...</div>, an optional <style>
  block, and an optional <script> block.
"""
import json
import re
import sys
from pathlib import Path

NOTE_RE = re.compile(r"<!--\s*note:\s*(.*?)\s*-->", re.DOTALL)
STYLE_RE = re.compile(r"<style>(.*?)</style>", re.DOTALL)
SCRIPT_RE = re.compile(r"<script>(.*?)</script>", re.DOTALL)
DIV_RE = re.compile(r"(<div class=\"slide[^\"]*\".*</div>)\s*$", re.DOTALL)


def strip_blocks(text):
    text = NOTE_RE.sub("", text)
    text = STYLE_RE.sub("", text)
    text = SCRIPT_RE.sub("", text)
    return text.strip()


def parse_fragment(path):
    text = path.read_text()
    note_m = NOTE_RE.search(text)
    style_m = STYLE_RE.search(text)
    script_m = SCRIPT_RE.search(text)
    markup = strip_blocks(text)
    if not markup:
        raise ValueError(f"{path}: no slide markup found")
    return {
        "note": note_m.group(1).strip() if note_m else "",
        "markup": markup,
        "style": style_m.group(1).strip() if style_m else "",
        "script": script_m.group(1).strip() if script_m else "",
    }


def main():
    if len(sys.argv) < 3:
        sys.exit(__doc__)
    deck_dir = Path(sys.argv[1])
    template_path = Path(sys.argv[2])
    out_path = Path(sys.argv[3]) if len(sys.argv) > 3 else deck_dir / "deck.html"

    identity = json.loads((deck_dir / "deck.json").read_text())
    fragments = sorted((deck_dir / "slides").glob("*.html"))
    if not fragments:
        sys.exit("no fragments found in slides/")
    slides = [parse_fragment(p) for p in fragments]

    html = template_path.read_text()

    for key, value in identity.items():
        html = html.replace(f"__{key.upper()}__", str(value))
    html = html.replace("__COUNT__", str(len(slides)))

    html = html.replace(
        "<!-- __SLIDES__: one <div class=\"slide active\" id=\"s1\"> ... </div> per outline entry, first slide carries class \"active\" -->",
        "\n\n".join(s["markup"] for s in slides),
    )

    engine_marker = "/* ── /ENGINE. Append per-deck identity and per-slide CSS below this line. ── */"
    per_slide_css = "\n".join(s["style"] for s in slides if s["style"])
    html = html.replace(engine_marker, engine_marker + "\n" + per_slide_css)

    notes_js = json.dumps([s["note"] for s in slides], ensure_ascii=False)
    html = html.replace(
        "// __NOTES__: one string per slide, same order as slides, empty string where there is none\nconst NOTES=[];",
        f"const NOTES={notes_js};",
    )

    run_anim_body = "\n".join(
        f"  if(n==={i}){{\n{s['script']}\n  }}" for i, s in enumerate(slides) if s["script"]
    )
    html = html.replace(
        "function runAnim(n){\n}",
        f"function runAnim(n){{\n{run_anim_body}\n}}",
    )

    out_path.write_text(html)
    print(f"wrote {out_path} ({len(slides)} slides)")


if __name__ == "__main__":
    main()
