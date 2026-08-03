---
name: product-discovery
description: Research the market and product space before building. Delegates to the product-discovery agent for web research, then synthesizes into docs/product/discovery.md.
---

# Product Discovery

Research the market, competitors, and product space before brainstorming begins. The output is `docs/product/discovery.md`: the shared context that makes design grounded instead of speculative.

## When to use

- Before **brainstorming** (product scope) when no `docs/product/discovery.md` exists.
- When the user asks to research competitors, market, or prior art.
- When brainstorming reveals the team lacks domain context.

## Process

1. Determine scope: **external product** (customers, market, revenue) or **internal tool** (team-facing, no market).
2. Delegate to the **product-discovery agent** for web research, passing the idea description and scope type. The agent uses `web_search` and `web_fetch` to gather data.
3. For parallel research (multiple competitors or multiple axes), use the graph-orchestrate fan-out pattern: delegate one subagent per competitor or axis, then fan-in and synthesize.
4. Review the agent's output against the matching template in `reference/`.
5. Save to `docs/product/discovery.md`.

## Scopes

### External product

Research axes (see `reference/external-product.md`):
- Direct competitors and adjacent solutions
- Target user segments and their pain
- Pricing models and business viability
- Gaps, unmet needs, consistent complaints
- Patterns of successful products in the space

Output template: What It Is, Problem, Target Users, Design Principles, Market Landscape, Gaps and Opportunities, Positioning, Business Model, Assumptions and Risks.

### Internal tool

Research axes (see `reference/internal-tool.md`):
- Current process or workaround being replaced
- Users (teams, roles) and their pain with current state
- Integrations and constraints
- Existing internal tools that overlap

Output template: Purpose, Users, Scope, Current Process, Integrations, Constraints, Success Criteria, Assumptions.

## Memory integration

After saving `docs/product/discovery.md`, write a summary to ai-memory:

```
@ai-memory/memory_write_page
  namespace: product
  page_title: discovery/<project-name>
  content: [key findings, positioning, gaps, assumptions]
```

Query ai-memory before starting to check for prior discovery on the same or related products:

```
@ai-memory/memory_query
  namespace: product
  query: [product idea keywords]
```

## Done When

`docs/product/discovery.md` is saved and covers all axes for the scope. Suggest **brainstorming** (product scope) as the next step.
