---
name: grill-me
description: "Use when stress-testing, reviewing, or pressure-testing an existing plan, design, or decision. Systematically interrogates every decision point — one question at a time — until a shared understanding is reached."
---

# Grill Me

Use when the user has a plan, design, or decision and wants it thoroughly challenged before committing. Goal: surface hidden assumptions, weak points, and unresolved dependencies — not generate alternatives. For generating options, use **brainstorming** instead.

Reserve for decisions that are expensive to reverse: data model changes, public API contracts, security posture, infrastructure choices. Skip for small or low-stakes features.

## Constraints

- One question at a time. Include a recommended answer when one is clear.
- Do not ask for information you can read yourself — inspect the codebase first.
- Navigate the full decision tree — do not stop early.
- If an answer reveals a gap or contradiction, name it directly and ask the follow-up.

## Process

1. Read `docs/product/vision-and-strategy.md` if it exists. Extract Principles and Anti-goals; these are hard constraints, not preferences.
2. Read the user's description and inspect relevant codebase context. Identify major decision areas: goals, constraints, data flow, failure modes, dependencies, rollout, validation.
3. Map decisions to validate, starting with any principle or anti-goal conflict:
   - **Product/feature:** problem definition, success metric, MVP scope, edge cases, rollout, observability, external dependencies
   - **Architecture:** component boundaries, data model, API contracts, failure modes, scaling, migration path, operational burden
   - **Implementation:** fit with existing patterns, risk surface, test coverage, reversibility, performance
4. Start with the most load-bearing decision — the one that invalidates the most downstream choices if wrong. Follow each answer's branch before moving on.

   Format each question as:
   > **[Topic]:** [Question]
   >
   > Recommended: [recommendation, or "no strong preference"]

5. After covering all material decision points, check whether any answer revealed a new contradiction, unresolved dependency, or principle violation. If yes, re-enter step 4 for those points before summarizing.
6. Summarize: decisions that are solid, assumptions validated, risks or gaps that remain open, items that need a decision before proceeding.
7. Ask whether to proceed, revise, or dig deeper into any open item. On revision, re-enter the interrogation at the affected decision point — do not restart.

## Done When

All material decision points covered and user approves to proceed. Suggest **implementation-plan** to sequence the work.
