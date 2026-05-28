---
name: architecture-design
description: "Use when designing, critiquing, or modernizing software architecture: feature architecture, service boundaries, APIs, integrations, data flow, migrations, failure modes, business-rule extraction, and implementation contracts before coding."
---

# Architecture Design

Use this skill when the user wants to turn a product idea, feature, integration, refactor, or modernization effort into an implementation-ready architecture.

The goal is to create a clear technical contract, not a large architecture document.

## Core Rules

- Do not implement while architecture is still being designed unless the user explicitly asks to move into implementation.
- Ask one question at a time when key context is missing.
- Use Markdown text by default. Do not generate diagrams, Mermaid, Graphviz, visual maps, or mockups unless the user explicitly asks.
- Do not use emoji, decorative icons, XML-style pseudo tool calls, or fake function-call markup.
- Prefer the simplest architecture that satisfies the stated requirements.
- Be skeptical of new services, abstractions, queues, event buses, frameworks, and generic layers unless they solve a concrete problem.
- Separate business rules from implementation details before changing legacy or unclear code.
- State assumptions, non-goals, and unresolved decisions explicitly.

## When To Use Each Mode

Use the lightest mode that fits the request.

### Feature Architecture

Use when designing a new capability or significant behavior change.

Focus on:
- actors and user/system surfaces
- domain boundaries
- states and transitions
- APIs and contracts
- data model changes
- rollout and backwards compatibility
- tests and observability

### System Integration

Use when connecting systems, APIs, queues, webhooks, jobs, or external services.

Focus on:
- ownership of each system
- request/response or event contracts
- idempotency and retries
- authentication and authorization
- failure handling and recovery
- rate limits, timeouts, and backpressure
- data consistency expectations

### Modernization Or Refactor

Use when changing legacy code, untangling modules, or moving behavior between layers.

Before proposing the new structure:
- identify the behavior that must not change
- extract business rules from the current code
- separate domain policy from technical plumbing
- call out magic numbers, thresholds, state transitions, validations, and calculations
- identify where tests need to pin behavior before refactoring

### Architecture Critique

Use when reviewing an existing proposal, plan, or implementation direction.

Adopt a skeptical principal-engineer stance:
- Do we need this complexity?
- What is the simplest design that meets the requirements?
- Does each boundary reflect a real domain boundary?
- Which non-functional requirements are missing?
- What happens when a dependency is down?
- Is the migration story concrete?
- Are there abstractions with only one implementation and no clear second use?

## Process

### 1. Understand The Current Shape

For an existing repo, inspect only relevant context:
- existing docs, routes, schemas, services, interfaces, tests, and nearby patterns
- current ownership boundaries and data flow
- prior decisions if ADRs/RFCs exist

For a new idea, start from the user's constraints and ask for missing context.

Do not read broadly just to feel informed.

### 2. Extract Business Rules

When current behavior matters, identify rules before designing changes.

Business rules include:
- calculations, fees, limits, thresholds, scores, and rounding
- validations and cross-field constraints
- eligibility and authorization policy
- lifecycle states and allowed transitions
- retry limits, cutoff times, retention periods, and escalation policy

Skip infrastructure-only details such as logging, connection pooling, framework glue, and UI layout.

If useful, format rules as:

```text
Rule:
Source:
Plain English:
Given:
When:
Then:
Parameters:
Confidence:
Open question:
```

### 3. Compare Options

Present 2-3 viable architectures before settling on one when the decision is non-trivial.

For each option:
- what it is
- when it works well
- tradeoff
- operational risk
- migration cost

Lead with the recommended option if there is enough signal.

### 4. Produce The Architecture Contract

Use only the sections that fit the request:

- Goal
- Context
- Recommendation
- Non-goals
- Business rules
- Boundaries
- Components
- Data flow
- API or event contracts
- State transitions
- Data model implications
- Security and permissions
- Error handling
- Failure modes
- Migration plan
- Observability
- Testing strategy
- Rollout plan
- Open questions
- Implementation phases

Keep the artifact concise and implementation-facing.

### 5. Critique Before Handoff

Before finalizing, run a short self-critique:

- Is this simpler than the obvious overbuilt version?
- Does every boundary have a reason?
- Is the data migration or compatibility story clear?
- Can one dependency failure be traced end to end?
- Are business rules preserved?
- Are errors observable at the backend/API boundary and understandable at the UI boundary?
- Are missing values represented explicitly instead of silently defaulted?

If a major weakness remains, call it out instead of smoothing it over.

## Output Patterns

### Option Comparison

| Option | Best for | Tradeoff | Risk | Migration cost |
| --- | --- | --- | --- | --- |
| A | ... | ... | ... | ... |
| B | ... | ... | ... | ... |

### Architecture Contract

```text
GOAL
- ...

RECOMMENDATION
- ...

BOUNDARIES
- ...

CONTRACTS
- ...

FAILURE MODES
- ...

OPEN QUESTIONS
- ...

NEXT STEP
- ...
```

### Critique

```text
FINDINGS
- Blocker:
- High:
- Medium:

IF I COULD ONLY CHANGE ONE THING
- ...
```

## Quality Bar

Before handing off:

- The design can be implemented without rediscovering core decisions mid-PR.
- Business rules are separated from technical choices.
- The MVP is smaller than the full future architecture.
- The recommendation names concrete tradeoffs.
- Failure modes, migration, and observability are not hand-waved.
- The answer is understandable without a diagram.
