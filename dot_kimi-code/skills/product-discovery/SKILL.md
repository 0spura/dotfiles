---
name: product-discovery
description: "Research the market, competitors, and product space to establish shared context before exploring what to build."
whenToUse: "Use before brainstorming features or designing a new product: research the market, competitors, and product space to establish shared context."
---

# Product Discovery

Establish shared context before deciding what to build. You own `docs/product/discovery.md`; the **product-discovery agent** owns research and returns findings.

## Process

1. Read `docs/product/discovery.md` if present; update beats rewrite.
2. Settle with the user what this does, who uses it, and the problem it solves. Decide the type here, with the user: **external product** (customers, market, revenue) or **internal tool** (a team's tool, no market). Ambiguity stops at this step, not inside an agent.
3. Read the matching reference: `reference/external-product.md` or `reference/internal-tool.md`.
4. Dispatch product-discovery research agents, one angle per agent from the reference's research axes. Internal tools still get web research: how leading players and standards solve this class of problem drives the design, even without a market.
5. Read the returned findings and dispatch a follow-up wave of background `Agent` calls (see **graph-orchestrate**) for the emerged topics that matter, deciding the fan-out from the content. Cap at two follow-up waves; a topic that still has not paid off is out of scope.
6. Write or update `docs/product/discovery.md` from the reference template, synthesizing every wave. Cite the source for each market or best-practice claim.

## Done When

Discovery is saved with sources, durable decisions are in memory, and the next step is **brainstorming**.
