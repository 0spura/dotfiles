---
name: product-discovery
description: Research the market or the current internal process before product brainstorming, then synthesize decision-relevant evidence into docs/product/discovery.md.
---

# Product Discovery

Decide first whether the idea is an external product or an internal tool, then read the matching reference: `skill://product-discovery/reference/external-product.md` or `skill://product-discovery/reference/internal-tool.md`.

## Workflow

1. For tracked discovery, use the canonical workctl issue supplied by `plan`; otherwise use the current approved request as scope. Research-only work does not require an implementation branch or a tracker item.
2. Cover only the axes that can change that decision, and prefer primary sources for material market, standards, and competitor claims; identify the source and date so a reviewer can assess secondary evidence. When the research is split across agents, give each one an independent axis.
3. Separate observed facts, sourced claims, assumptions, and recommendations; quantify frequency and impact when the evidence permits.
4. Update rather than overwrite `docs/product/discovery.md`, citing evidence near each material claim with the research date. Link findings to the issue when tracked; otherwise return the artifact and unresolved choice to `brainstorming`.

## Done when

The document answers the decision it was gathered for, marks what is estimated, and names the choice the evidence cannot make.

## Output

The document, the conclusion it supports, and the unresolved choice; recommend `brainstorming` next.

## Stop conditions

Stop when the evidence cannot answer the decision without a user choice, and state that gap.
