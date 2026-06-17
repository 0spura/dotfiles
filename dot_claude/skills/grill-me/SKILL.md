---
name: grill-me
description: "Use when stress-testing, reviewing, or pressure-testing an existing plan, design, or decision. Systematically interrogates every decision point — one question at a time — until a shared understanding is reached."
---

# Grill Me

Use when the user has a plan, design, or decision and wants it thoroughly challenged before committing. Goal: surface hidden assumptions, weak points, and unresolved dependencies — not generate alternatives. For generating options, use **brainstorming** instead.

Ask one question at a time. Include a recommended answer when one is clear. Navigate the full decision tree — do not stop early.

## Process

### 1. Understand The Plan

Before asking anything: read the user's description and inspect relevant codebase context. Identify major decision areas: goals, constraints, data flow, failure modes, dependencies, rollout, validation.

Do not ask for information you can read yourself.

### 2. Build The Decision Tree

Map decisions to validate:
- **Product/feature:** problem definition, success metric, MVP scope, edge cases, rollout, observability, external dependencies
- **Architecture:** component boundaries, data model, API contracts, failure modes, scaling, migration path, operational burden
- **Implementation:** fit with existing patterns, risk surface, test coverage, reversibility, performance

### 3. Interrogate Sequentially

Start with the most load-bearing decision — the one that invalidates the most downstream choices if wrong. When an answer opens a new branch, follow it before moving on.

Format each question as:

> **[Topic]:** [Question]
>
> Recommended: [recommendation, or "no strong preference"]

If an answer reveals a gap or contradiction, name it directly and ask the follow-up.

### 4. Surface Findings

After covering all material decision points, summarize:
- Decisions that are solid
- Assumptions that were validated
- Risks or gaps that remain open
- Items that need a decision before proceeding

### 5. Close Or Continue

Ask whether the user wants to proceed, revise the plan, or dig deeper into any open item. On revision, re-enter the interrogation at the affected decision point — do not restart.

On approval, suggest **implementation-plan** to sequence the work before writing code.
