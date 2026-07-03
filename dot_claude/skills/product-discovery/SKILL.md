---
name: product-discovery
description: "Use before brainstorming features or designing a new product: research the market, competitors, and product space to establish shared context before exploring what to build."
allowed-tools: Read, Grep, Glob, WebSearch, WebFetch, Write, Edit
---

# Product Discovery

Use as the first step when starting a new product or feature area. Goal: build shared understanding of the market landscape so brainstorming stays grounded — features debated without this context tend to drift from what the market actually needs.

## Constraints

- One question at a time if multiple things are unclear.
- Prioritize products users would consider as alternatives — go broad first, then narrow.
- The discovery document must be self-contained: no other introduction needed when an agent reads it cold.

## Process

1. If not already clear, ask: what does this product do, who is it for, what problem does it solve.
2. Use `WebSearch` to find similar products, direct competitors, and adjacent solutions; use `WebFetch` to read a source when a result is thin. For each: what it does, who it targets, pricing model, key differentiators, known weaknesses, user sentiment patterns.
3. Synthesize findings: main players and what they own, gaps and unmet needs, consistent user complaints across the category, patterns of successful products.
4. Define the product position: most defensible niche given what exists, ICP, what "winning" looks like against existing alternatives.
5. Read `reference/template.md`, then write `docs/product/discovery.md`.

## Done When

Document saved and approved. Suggest **brainstorming** (product scope) to define the vision and philosophy before requirements.
