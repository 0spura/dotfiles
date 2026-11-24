---
name: product-discovery
description: Research the market or current internal process before product brainstorming, separating observed facts from assumptions and synthesizing decision-relevant evidence into docs/product/discovery.md.
---

# Product Discovery

Gather only the evidence needed to make a real product or process decision, keeping facts, sourced claims, and assumptions strictly separate.

Classify the initiative first and read the matching reference before researching:
- External product → `skill://product-discovery/reference/external-product.md`
- Internal tool/process → `skill://product-discovery/reference/internal-tool.md`

## House rules

1. **Decision-driven axes only.** Research only questions whose answers can actually change the product direction.
2. **Primary sources with dates.** Prefer primary sources for market, standards, and competitor claims; cite source and date inline beside every material claim.
3. **Separate fact from estimate.** Never blur observed facts, sourced claims, assumptions, and recommendations into one paragraph.
4. **Update, never blindly overwrite.** Append or refine `docs/product/discovery.md` while preserving valid prior evidence.
5. **Stop at user judgment calls.** When evidence cannot decide between options without a product/business choice, stop and surface that gap.

## Workflow

1. **Classify & scope.** Decide `external-product` vs. `internal-tool`, read its reference, and list the specific decision axes. (If splitting across parallel agents, assign each agent one independent axis.)
2. **Collect evidence.** Gather primary data, quantify frequency and impact where possible, and mark every estimate explicitly.
3. **Synthesize cleanly.** Update `docs/product/discovery.md` with inline citations + research dates, clear separation of facts vs. assumptions, and the conclusion supported.
4. **Hand off.** Return the document, supported conclusion, and unresolved user choice; recommend `brainstorming` next.

## Checklist

- [ ] Correct reference (`external-product.md` or `internal-tool.md`) applied.
- [ ] Every material claim cites source and date inline.
- [ ] Observed facts, estimates/assumptions, and recommendations are visibly separated.
- [ ] Unresolved choices that require user judgment are named explicitly.

## Never

- Research tangential topics that cannot change the decision.
- Present an estimate or secondary blog post as an observed fact.
- Invent a product decision when the evidence is inconclusive.

## Output

Updated `docs/product/discovery.md`, supported conclusion, unresolved user choices, and handoff to `brainstorming`.
