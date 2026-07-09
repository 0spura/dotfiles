---
name: paper-review
description: "Pressure-test a paper at any phase, whether shape, skeleton, draft, or final, by reviewing it three ways at once, then synthesize a mock notification with a phased revision list."
disable-model-invocation: true
model: opus
effort: medium
---

# Paper Review

Simulate how a program committee reaches a decision. Several readers approach the same paper differently, and the notification is their reconciled verdict. Run that before you submit, and earlier, on the shape or the skeleton, so a fatal problem is caught while it is one paragraph to fix rather than a rewrite.

For drafting or applying the revisions this surfaces, use **academic-writing**. For interrogating the underlying research idea rather than the manuscript, use **grill-me**.

## Process

1. **Gather the inputs.** The artifact and its phase, one of shape, skeleton, draft, or final, plus the venue's call for papers and review criteria as a path or a URL. Ask the user for whichever is missing. Without the venue's criteria a review cannot judge fit, the most common cause of rejection, and without the phase a review judges an outline as if it were a finished paper.
2. **Fan out three reviewers in parallel.** Dispatch three `paper-review` agents at once, each given the artifact, its phase, the call, and one review technique, one for criteria scoring, one for adversarial desk-reject, and one for reader simulation. Running them as one batch keeps their verdicts independent, the way separate PC members are.
3. **Synthesize the notification.** Reconcile the three returns into one decision. Give a consolidated overall-merit verdict, the strengths and weaknesses more than one reviewer raised with duplicates merged, and a single revision list ordered by how much each change moves the decision. Separate must-fix that blocks acceptance from polish, tag each finding with the writing phase it sends the work back to, and name the one change that lifts the paper a full merit level.

## Done When

The synthesized notification is delivered. Suggest **academic-writing** to apply the revisions, re-entering the earliest phase they touch.
