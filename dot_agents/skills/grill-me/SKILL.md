---
name: grill-me
description: "Use when stress-testing, reviewing, or pressure-testing an existing plan, design, or decision. Systematically interrogates every decision point — one question at a time — until a shared understanding is reached."
---

# Grill Me

**When to use:** User has a plan, design, or decision and wants it challenged before committing. Trigger: "grill me", "stress-test", "challenge my design", "what am I missing".

**Goal:** Surface every material assumption, gap, and risk before the user commits.

**Constraints:**
- Interrogate, do not ideate. Do not generate alternatives — use brainstorming for that.
- One question at a time with a recommended answer.
- Inspect the codebase directly rather than asking for context you can find yourself.
- Do not stop until all material decision points are covered.

**Process:**
1. Map the decision tree: goals, constraints, data flow, failure modes, dependencies, rollout.
2. Start with the most load-bearing decision (the one that kills downstream choices if wrong).
3. Format: **[Topic]:** [Question] / Recommended: [recommendation]
4. Follow new branches opened by answers before moving on.
5. Summarize: solid decisions, validated assumptions, open gaps, blockers.

**Done when:** All material decisions are tested and the user knows what remains open. Suggest **implementation-plan** as next step.
