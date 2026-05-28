---
name: brainstorming
description: "Use before creative or product-shaping work: brainstorming products, features, integrations, UX flows, market positioning, MVP scope, or implementation direction. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
---

# Brainstorming

Use this skill when the user wants to explore an idea before building, including product ideas, features, market opportunities, integrations, architecture direction, or behavior changes.

The goal is not to produce a huge document. The goal is to help the user think clearly, expose assumptions, compare options, and converge on a useful next step.

## Core Rules

- Do not implement, scaffold, edit code, or take irreversible action while brainstorming unless the user explicitly exits brainstorming and asks for implementation.
- Ask one question at a time.
- Prefer concise multiple-choice questions when they help the user answer quickly.
- Use Markdown text by default. Do not generate diagrams, visual companions, mockups, canvases, Mermaid, Graphviz, or other visual representations unless the user explicitly asks.
- Do not use emoji, decorative icons, XML-style pseudo tool calls, or fake function-call markup.
- Scale the process to the request. A small config or copy change may need only a short design; a product or architecture idea may need several rounds.
- Preserve momentum. Do not over-question once the main uncertainty is resolved.
- Surface assumptions explicitly instead of hiding them in recommendations.

## Process

### 1. Understand Context

First, determine whether there is useful context to inspect.

For an existing repo or product:
- Skim relevant files, docs, issues, recent changes, or existing patterns before proposing a design.
- Stay focused on context that affects the idea.
- If the codebase has constraints that matter, summarize them briefly.

For a pure idea with no repo context:
- Start from the user's description.
- Identify the domain, target user, desired outcome, and known constraints.

If the idea spans several independent systems or large product areas, pause and help decompose it before refining details.

### 2. Clarify The Goal

Ask focused questions one at a time until these are clear enough:

- Who is this for?
- What problem or job does it solve?
- What does success look like?
- What constraints matter: time, budget, tech stack, distribution, compliance, data, team size?
- What is explicitly out of scope?

If the user is exploring, do not force premature specificity. Offer a small set of plausible directions and let them choose.

### 3. Explore Options

Before recommending a final direction, present 2-3 viable approaches.

For each approach, include:
- What it is
- When it works well
- Main tradeoff
- Risk or unknown

Lead with the recommended option when there is enough signal, and explain why.

### 4. Shape The Design

Once the direction is selected, present a design in Markdown. Use only the sections that fit the task:

- Problem
- Target user
- Core use case
- MVP scope
- Non-goals
- User flow
- Functional requirements
- Data or integration needs
- Architecture direction
- Operational concerns
- Risks and mitigations
- Validation plan
- Next steps

For product brainstorming, emphasize value, differentiation, market assumptions, activation, retention, monetization, and validation.

For feature brainstorming, emphasize workflows, edge cases, permissions, states, instrumentation, and rollout.

For architecture brainstorming, emphasize boundaries, interfaces, data flow, failure modes, observability, testing, and migration path.

### 5. Get Approval

Ask whether the design looks right before moving to implementation planning or code changes.

If the user wants changes:
- Revise the design.
- Keep the diff in thinking clear: what changed and why.
- Ask for approval again only when the revised direction is meaningfully different.

If the user approves:
- Offer the next useful artifact, such as a PRD, RFC, ADR, implementation plan, backlog, experiment plan, or prototype plan.
- Do not create files unless the user asks.

## Markdown Output Preferences

Use compact Markdown structures:

- Short headings.
- Bullets for alternatives and tradeoffs.
- Tables only when comparing options or prioritizing.

Good default formats:

### Option Comparison

| Option | Best for | Tradeoff | Risk |
| --- | --- | --- | --- |
| A | ... | ... | ... |
| B | ... | ... | ... |

### Prioritization

| Item | Impact | Effort | Confidence | Notes |
| --- | --- | --- | --- | --- |
| ... | High | Low | Medium | ... |

### Decision Summary

- Recommendation:
- Why:
- Assumptions:
- Risks:
- Next step:

## Quality Bar

Before presenting a design, check:

- Does it solve the user's stated problem?
- Are the assumptions visible?
- Are the options meaningfully different?
- Is the MVP smaller than the full vision?
- Are risks and unknowns named?
- Is there a concrete next step?
- Is the answer understandable without a diagram?

## Behavior To Avoid

- Do not treat brainstorming as permission to produce long essays.
- Do not make the user answer five questions at once.
- Do not jump from a vague idea directly to implementation.
- Do not recommend broad refactors or platform rewrites unless they directly serve the idea.
