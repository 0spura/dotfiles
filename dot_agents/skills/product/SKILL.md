---
name: product
description: "Use when shaping digital product strategy: positioning, market fit, growth motion, pricing, retention, or go-to-market. Applies practitioner frameworks (JTBD, PLG, NRR, LTV:CAC) to help make product decisions with market clarity before building."
---

# Product

Use this skill when the work is about the product itself — not a specific feature's implementation, but whether the right thing is being built, for whom, and how it will grow. Think market positioning, growth motion, pricing strategy, retention loops, and validation.

If the user needs to explore a specific feature workflow, use the **brainstorming** skill instead.

## Core Rules

- Think like a founder and a PM simultaneously: one asks "does the market want this?", the other asks "can we build and ship this?".
- Name the product stage before applying frameworks. A pre-PMF product and a scaling product need completely different decisions.
- Use precise market vocabulary. Vague terms like "grow users" obscure real decisions. Replace with MRR growth, activation rate, NRR, CAC payback.
- Ask one question at a time.
- Surface assumptions about the market explicitly — most product failures are assumption failures, not execution failures.
- Do not brainstorm features. Redirect to the brainstorming skill when the conversation narrows to implementation.

## Product Stages

Identify the stage before advising. Applying scaling frameworks to a pre-PMF product is one of the most common traps.

| Stage | Signal | Priority |
|---|---|---|
| **0 → 1** | No paying users or <10 customers | Discover if the problem is real and the willingness to pay exists |
| **PMF search** | Users churn or don't activate despite interest | Find the ICP, aha moment, and retention floor |
| **Early growth** | Retention is solid, need repeatable acquisition | Nail the growth motion (PLG or sales-led), CAC payback |
| **Scaling** | Acquisition works, optimize unit economics | NRR, expansion revenue, LTV:CAC, burn multiple |

## Key Frameworks

### Market & Positioning

**Jobs-to-be-Done (JTBD):** Users hire products to make progress in a specific context. The job is rarely the feature — it's the outcome. Ask: "What was the user doing before this product existed?"

**ICP (Ideal Customer Profile):** The narrow segment where your product wins decisively, not broadly. Over-broad ICPs produce weak positioning and high churn. Narrow until it hurts.

**Positioning:** Define against a specific alternative (not "the status quo"). Users always have an alternative — explicit or implicit. Frame value relative to it.

**TAM/SAM/SOM:** Total Addressable Market → Serviceable Addressable Market → Serviceable Obtainable Market. SOM is what matters for near-term planning. Large TAM with no path to SOM is a red flag.

**Moats:** What makes the product defensible? Options: network effects (direct, indirect, data), switching costs, proprietary data, brand, scale economies. Most early products have none — name the planned moat explicitly.

### Metrics by Stage

**Pre-PMF:**
- Activation rate: % of signups who reach the aha moment
- D1/D7/D30 retention: % of users still active after 1, 7, 30 days
- Qualitative PMF signal: Sean Ellis test — "How would you feel if you could no longer use this product?" Target: >40% "very disappointed"

**Early growth:**
- MRR (Monthly Recurring Revenue): baseline health metric
- MRR growth rate: target >15%/month at early stage
- CAC (Customer Acquisition Cost): fully-loaded cost to acquire one customer
- CAC payback period: months to recover CAC from gross margin. Target: <12 months for SMB, <18 months for enterprise

**Scaling:**
- ARR (Annual Recurring Revenue): MRR × 12, used for larger businesses
- NRR / Net Revenue Retention: revenue from existing customers after expansion, contraction, and churn. Formula: (Starting MRR + expansion − contraction − churn) / Starting MRR × 100. Benchmark: >100% = growing without new customers; >120% = elite
- Gross churn: % of MRR lost from cancellations only
- LTV (Lifetime Value): average gross margin per customer × average lifetime. Rule of thumb: LTV:CAC > 3:1
- Burn multiple: net burn / net new ARR. <1 = efficient, >2 = inefficient
- Rule of 40: revenue growth rate + profit margin ≥ 40% (healthy SaaS)

### Growth Motion

**PLG (Product-Led Growth):** The product itself is the primary acquisition, activation, and expansion driver. Works when the value is immediately demonstrable and the end user can adopt without procurement. Examples: Figma, Notion, Slack.

**Sales-Led Growth:** Relationships and outbound drive acquisition. Works when the buyer ≠ user, deal sizes are large, or the problem requires education. Examples: Salesforce, Workday.

**Land and Expand:** Start with a small footprint in a team or department, expand to the org. Requires strong NRR and a natural expansion trigger (seats, usage, features).

**Viral / K-factor:** K = (invites sent per user) × (conversion rate of invites). K > 1 = viral growth. Most products have K < 1 — do not build strategy around virality without evidence.

**Network effects:** Value increases as more people use the product. Direct (messaging), indirect (marketplace), data (ML improves with usage). Name which type and whether it's local or global.

### Pricing & Packaging

**Value metric:** What the price scales with. Good value metrics correlate with value delivered (seats, API calls, documents). Bad ones create friction at the wrong moment (storage for a collaboration tool).

**Pricing tiers:** Good/better/best packaging should move users between tiers based on value, not arbitrary limits. Each tier needs a clear ICP.

**Freemium vs free trial:** Freemium retains users at low activation; works with large top-of-funnel and PLG. Free trial forces activation; works when value is demonstrable fast. Do not use freemium to avoid the hard work of activation.

**Willingness to pay:** Validate with a pricing page before building. Charge earlier than feels comfortable — late pricing discovery wastes runway.

### Retention & Engagement

**Aha moment:** The specific action correlating with long-term retention. Find it by analyzing what activated users did differently in the first session. Examples: Twitter's "follow 30 people", Slack's "2000 messages sent".

**Activation milestone:** The sequence of steps from signup to aha moment. Shorten it ruthlessly. Every step that doesn't deliver value is churn risk.

**Hooked model:** Trigger → Action → Variable Reward → Investment. Useful for habit-forming products. Investment (user data, content, connections) increases switching costs over time.

**Retention floor:** D30 retention that stabilizes into a flat curve. If the curve reaches zero, you have no retained users — fix retention before investing in acquisition.

### Validation

**Smoke test:** Put up a landing page or pricing page before building. Measure conversion, not interest.

**Concierge MVP:** Deliver the promised value manually. Validate demand without building the product.

**Build-Measure-Learn:** Minimize the build to what's needed to test one hypothesis. State the hypothesis before building, not after.

**Riskiest assumption:** Name the single assumption that, if wrong, kills the product. Test it first, not last.

## Process

### 1. Identify Stage And Context

Before advising, determine:
- What stage is the product at? (0→1, PMF search, early growth, scaling)
- What is the business model? (subscription, transactional, marketplace, usage-based)
- Who is the ICP, and how confident is that definition?
- What does the user want to decide or validate?

If the product is pre-PMF, focus entirely on problem validation and ICP sharpness — growth and pricing frameworks do not apply yet.

### 2. Name The Core Question

Identify what is actually being decided:
- Is this about whether to build something (validation)?
- Is this about positioning and messaging?
- Is this about which growth motion to pursue?
- Is this about pricing?
- Is this about why users are churning?

Different questions require different frameworks. Do not apply all frameworks to every question.

### 3. Apply The Relevant Framework

Select 1-2 frameworks that fit the stage and question. Explain why they apply. Surface the assumptions they require.

### 4. Name The Metrics That Matter

For any product decision, name:
- What metric improves if the decision is right
- What the current baseline is (or that it's unknown)
- What a meaningful improvement looks like

Avoid vague goals. "Improve retention" is not a goal. "Improve D30 retention from 12% to 20% for the SMB ICP" is.

### 5. Recommend And State The Assumption

Lead with a recommendation. Then state the key assumption it rests on. If that assumption is wrong, the recommendation changes — say so explicitly.

## What To Avoid

- Do not apply scaling frameworks (NRR, burn multiple, LTV:CAC) to pre-PMF products.
- Do not recommend virality or network effects without evidence they exist in the product.
- Do not conflate activation with acquisition. Getting users is not the same as getting users who stay.
- Do not let "we'll figure out pricing later" go unchallenged — it is a real risk.
- Do not generate a feature list in response to a retention or churn problem without first checking whether activation was ever completed.
