---
name: brainstorming
description: "Use before building a feature or integration: explore workflows, edge cases, architecture direction, and behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
---

# Brainstorming

Use this skill when the user wants to explore how something should work before building it: feature workflows, integrations, architecture direction, or behavior changes.

The goal is not to produce a huge document. The goal is to help the user think clearly, expose assumptions, compare options, and converge on a useful next step.

## Core Rules

- Do not implement, scaffold, edit code, or take irreversible action while brainstorming unless the user explicitly exits brainstorming and asks for implementation.
- The only default file-editing exception is the architecture decision log described below. Do not change product code while maintaining it.
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

For feature brainstorming, emphasize workflows, edge cases, permissions, states, instrumentation, and rollout.

For architecture brainstorming, emphasize boundaries, interfaces, data flow, failure modes, observability, testing, and migration path.

For product-level decisions (positioning, market fit, pricing, retention, growth motion), use the **product** skill instead.

### 5. Maintain The Architecture Decision Log

When brainstorming in a repository and an architectural decision is confirmed, create or update:

```text
docs/architecture/decision-log.md
```

Treat a decision as confirmed when the user explicitly chooses an option, approves a recommendation, or continues from it as an agreed constraint. Do not log tentative ideas, unanswered questions, or every conversational detail.

Before the first write, inspect the repository for an existing decision log, ADR convention, or architecture-doc location. Follow the existing convention when one exists. Otherwise use the default path above.

Append concise entries in chronological order:

```markdown
## YYYY-MM-DD - Short decision title

- Status: Proposed | Accepted | Superseded
- Context: Why the decision was needed.
- Decision: What was chosen.
- Alternatives: Other options seriously considered.
- Consequences: Important benefits, costs, risks, and constraints.
- Follow-up: ADR needed | No ADR needed | Open question.
```

Rules for maintaining the log:

- Update an existing entry instead of creating duplicates when the same decision evolves during the session.
- Preserve prior decisions; mark them `Superseded` rather than deleting their history.
- Keep entries factual and compact.
- Use `Accepted` only after user approval. Use `Proposed` when the direction is recommended but not yet approved.
- Mark `ADR needed` for decisions that affect system boundaries, data ownership, public contracts, infrastructure, security posture, migration strategy, or other choices that are costly to reverse.
- Mention each log update briefly in the response so the user knows what was recorded.

If there is no repository or writable project context, include a compact decision summary in the response instead of creating a file.

### 6. Get Approval

Ask whether the design looks right before moving to implementation planning or code changes.

If the user wants changes:
- Revise the design.
- Keep the diff in thinking clear: what changed and why.
- Ask for approval again only when the revised direction is meaningfully different.

If the user approves:
- Offer the next useful artifact, such as a PRD, RFC, ADR, implementation plan, backlog, experiment plan, or prototype plan.
- Do not create files unless the user asks, except for the architecture decision log.
- If the design is non-trivial, suggest using the **grill-me** skill to pressure-test it before moving to implementation.

## Quality Bar

Before presenting a design, check:

- Does it solve the user's stated problem?
- Are the assumptions visible?
- Are the options meaningfully different?
- Is the MVP smaller than the full vision?
- Are risks and unknowns named?
- Were confirmed architectural decisions added to the decision log?
- Is there a concrete next step?
