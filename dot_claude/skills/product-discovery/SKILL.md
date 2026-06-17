---
name: product-discovery
description: "Use before brainstorming features or designing a new product: research the market, competitors, and product space to establish shared context before exploring what to build."
---

# Product Discovery

Use as the first step when starting a new product or feature area. Goal: build a shared understanding of the market landscape so that brainstorming stays grounded — features debated without this context tend to drift from what the market actually needs.

## Process

### 1. Understand The Product

If not already clear, ask: what does this product do, who is it for, what problem does it solve. One question at a time if multiple things are missing.

### 2. Research The Market

Search for similar products, direct competitors, and adjacent solutions. For each relevant product:
- What it does and who it targets
- Pricing model (if public)
- Key differentiators and known weaknesses
- User sentiment patterns (reviews, forums, social media)

Go broad first, then narrow to the most relevant players. Prioritize products users would consider as alternatives.

### 3. Map The Landscape

Synthesize findings:
- Who the main players are and what they each own
- Where the gaps and unmet needs are
- What users consistently complain about across the category
- What patterns successful products in this space share

### 4. Define The Product Position

Based on the research, establish:
- The most defensible position for this product given what already exists
- The ICP (Ideal Customer Profile) that best fits the gap
- What "winning" looks like against the existing alternatives

### 5. Save The Discovery Document

Save to `docs/product/discovery.md`. This is the authoritative context for the product — any agent starting fresh reads this first. It must be descriptive enough that no other introduction is needed: the SRS starts directly at requirements, the architecture doc starts directly at technical decisions.

```markdown
# [Product Name]

## What It Is
A clear, thorough description of the product — what it does, the core mechanic, and why it exists. Enough for someone with no prior context to understand the product deeply, not just superficially.

## Problem
The specific problem it solves. Be concrete: who feels this problem, when, and what they do today instead.

## Target Users
Who the product is for. Narrow enough to be useful — not "anyone who wants X" but the specific profile of the person who gets the most value and is most likely to pay.

## Design Principles
The non-negotiable constraints that shape every product decision. These are not aspirations — they are filters. If a feature violates a principle, it does not ship.
1. **[Principle]** — why it exists and what it rules out

## Market
Main competitors and adjacent solutions: what each covers, their pricing model, known weaknesses, and user sentiment patterns.

## Gaps
What the market consistently fails to deliver. Where users are underserved, frustrated, or resorting to workarounds.

## Position
What this product does differently and why it wins in its niche. Defined against a specific alternative, not "the status quo."

## Business Model
How it makes money. Pricing model, value metric, freemium vs paid, key monetization decisions.

## Assumptions
What we're taking as true that would change the strategy if wrong. Name the riskiest one first.
```

### 6. Hand Off

After the document is saved and approved, suggest **brainstorming**. The discovery doc is the input — brainstorming should not re-explain the product, it should build on it.
