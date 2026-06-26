---
name: product-discovery
description: "Use before brainstorming features or designing a new product: research the market, competitors, and product space to establish shared context before exploring what to build."
---

# Product Discovery

Use as the first step when starting a new product or feature area. Goal: build shared understanding of the market landscape so brainstorming stays grounded — features debated without this context tend to drift from what the market actually needs.

## Constraints

- One question at a time if multiple things are unclear.
- Prioritize products users would consider as alternatives — go broad first, then narrow.
- The discovery document must be self-contained: no other introduction needed when an agent reads it cold.

## Process

1. If not already clear, ask: what does this product do, who is it for, what problem does it solve.
2. Search for similar products, direct competitors, and adjacent solutions. For each: what it does, who it targets, pricing model, key differentiators, known weaknesses, user sentiment patterns.
3. Synthesize findings: main players and what they own, gaps and unmet needs, consistent user complaints across the category, patterns of successful products.
4. Define the product position: most defensible niche given what exists, ICP, what "winning" looks like against existing alternatives.
5. Save to `docs/product/discovery.md`.

## Template

```markdown
# [Product Name]

## What It Is
Clear description of the product — what it does, the core mechanic, and why it exists.
Enough for someone with no prior context to understand deeply, not just superficially.

## Problem
Specific problem it solves. Who feels it, when, and what they do today instead.

## Target Users
Narrow enough to be useful — the specific profile of the person who gets the most value and is most likely to pay.

## Design Principles
Non-negotiable constraints that shape every product decision. Filters, not aspirations.
If a feature violates a principle, it does not ship.
1. **[Principle]** — why it exists and what it rules out

## Market
Main competitors and adjacent solutions: what each covers, pricing model, known weaknesses, user sentiment patterns.

## Gaps
What the market consistently fails to deliver. Where users are underserved, frustrated, or resorting to workarounds.

## Position
What this product does differently and why it wins in its niche. Defined against a specific alternative, not "the status quo."

## Business Model
How it makes money. Pricing model, value metric, freemium vs paid, key monetization decisions.

## Assumptions
What we're taking as true that would change the strategy if wrong. Riskiest assumption first.
```

## Done When

Document saved and approved. Suggest **brainstorming** (product scope) to define the vision and strategy before requirements.
