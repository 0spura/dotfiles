---
name: academic-writing
description: "Draft an academic paper or thesis in phases that survive peer review, from fitting the venue through shaping the contribution, storyboarding the skeleton, and writing the prose."
disable-model-invocation: true
model: opus
effort: medium
---

# Academic Writing

A paper is accepted when a reviewer answers three questions without effort. What territory, what gap, and why it matters to this venue. This skill reaches that through phases, each approved before the next, so a weakness is caught while it is cheap to fix. A broken shape costs one sentence to redo. A broken draft costs a rewrite. The user brings the venue, the structure, and the content, and this skill shapes the rhetoric that carries them past review.

Run the phases in order. Do not write prose before the skeleton is approved. The whole point of storyboarding is to fix the argument while it is still one sentence per paragraph.

## Fit the venue first

The gate every later phase depends on. Read the venue's call for papers and review criteria, and ask the user for the call or edital if it is not provided. Pull out two things.

The track's object of study, meaning what the community actually rewards. A software-engineering venue rewards changing how software is built, maintained, or operated, not a strong result in the application domain the software happens to serve. A technically excellent paper aimed at the wrong object of study is rejected on fit alone, the most common desk-reject.

The paper type expected, such as a forward-looking idea, emerging results, or a full research paper, together with the explicit scoring criteria and the page and format limits.

For an empirical software-engineering venue, the primer *Notes on Writing Effective Empirical Software Engineering Papers* (arXiv 2506.11002) documents the section structure and structured abstract the community expects. Read it against the venue's own criteria, never as a substitute for them.

**Done when** one sentence exists, and the paper will contain it, naming which practice or research line in the venue's own field this work sets out to change. If that sentence is only about the application domain, stop and resolve the misfit before any writing.

## Shape the contribution

Fix what the paper claims before how it reads. Interrogate the contribution one question at a time until it answers so-what past the demonstration.

What does the contribution enable that was not possible before, meaning the new capability rather than the demo of it? What research lines does it open, meaning the questions now askable and the follow-on studies it makes tractable?

A proof of concept is where the paper starts, not where it ends. A demonstration that stops at "it works" reads as unfinished exactly where it should have begun. When the contribution itself is contested rather than just unclear, hand off to **grill-me** for a full interrogation, then return here.

State the contributions as a bulleted list, each one a claim the paper will back and phrased so a skeptical reader can check it. This is the spine the rest of the paper hangs on, and later each bullet earns a forward reference to the section that delivers it.

Phrase the one-paragraph claim in the ABT shape. Context (and), then tension (but), then resolution (therefore). It is the compact form of the motivation funnel used in the skeleton, and the same shape carries the abstract.

**Done when** the user approves a one-paragraph statement of the gap, the contribution, and its so-what.

## Storyboard the skeleton

The heart of the skill. Build the paper as assertions before prose. One sentence per paragraph, in order, stating the point that paragraph will defend. No final text yet.

Motivation funnel. The introduction's assertions widen before they narrow. Territory is the broad shift a non-specialist in the venue's field already cares about. Niche is the specific gap inside it this work occupies, shown to follow from the territory. Occupy is the contribution as the answer. Skipping territory is what a reviewer calls "no motivation."

Hourglass. Across the whole paper the assertions widen at the introduction, narrow to their most specific at method and results, then widen again through the discussion toward implications and generalization. The funnel is the top half of that shape, and the discussion mirrors it on the way out.

Related work placement. Decide where it sits. Holding it until after the idea has landed keeps the reader from wading through comparisons before they know what you did, though the venue's expected structure wins when it dictates otherwise.

C-C-C and chaining. The three-beat shape of context, content, and conclusion holds at the paper, the section, and each paragraph. Each assertion's lead-out sets up the next assertion's lead-in, so the argument flows as a chain you can check now.

Citation scaffolding. Slot candidate references under the assertion each one supports, so every claim has its evidence located before prose begins and related work becomes a matrix rather than an afterthought.

**Done when** the user approves the full assertion outline, every paragraph carries one assertion, the funnel is intact, the chain flows end to end, and each empirical assertion has a citation or a result slotted.

## Draft the prose

Only now turn each assertion into a paragraph that opens with it and then supports it. Never make the reader assemble the point from the evidence.

Introduce before use. Every term, tool, acronym, dataset, and metric is defined at its first appearance, and a foundational idea is never deferred past the section that first relies on it. The venue's target reader, competent but not a specialist in this subfield, must never meet a concept from nowhere.

Legible and honest evidence. Every figure is readable at print size and its caption stands alone. Every claim traces to a number. Threats to validity is a discussion that covers the operational cost of the approach, such as overhead and the parameters chosen and why, and the maintenance implications of the design decisions, not only generic sampling caveats. Reproducibility artifacts are linked.

Once the paragraphs exist, run the sentence-level pass in [`line-editing.md`](line-editing.md) for reader-expectation placement, unburied verbs, and the mechanical phrasing that reads as machine-written.

**Done when** every assertion from the skeleton is a paragraph and every principle above holds.

## Review

Pressure-test with **paper-review**, which can audit any phase, whether the shape, the skeleton, or the draft, not only the finished paper. Apply its revisions by re-entering the earliest phase they touch. A fit or so-what finding re-enters the shape phase. A flow finding re-enters the skeleton phase. A prose finding stays in the draft phase.

## Done When

The draft is complete, review findings are resolved, and every phase gate held.
