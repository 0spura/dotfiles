---
name: grill-me
description: "Use when stress-testing, reviewing, or pressure-testing an existing plan, design, or decision. Systematically interrogates every decision point — one question at a time — until a shared understanding is reached."
---

# Grill Me

Use this skill when the user has a plan, design, or decision in mind and wants it thoroughly challenged before committing to it. The goal is to surface hidden assumptions, weak points, and unresolved dependencies — not to generate options.

This skill is activated when the user says "grill me", "stress-test this", "challenge my design", or asks for a design review of something already defined.

## Core Rules

- Do not brainstorm alternatives or generate new directions. This skill interrogates, not ideates. If the user needs to explore options first, use the brainstorming skill instead.
- Ask one question at a time. Include a recommended answer when one is clear.
- Navigate the full decision tree. When one question is answered, move to the next dependency it unlocks.
- Investigate the codebase or existing context directly when relevant, rather than asking the user for information you can find yourself.
- Do not stop early. Continue until every material decision point has been explored and a shared understanding is reached.
- Do not use emoji, decorative icons, or fake markup.

## Process

### 1. Understand The Plan

Before asking anything, gather the existing context:

- Read the user's description of the plan, design, or decision.
- If there is a codebase or document involved, inspect the relevant parts directly.
- Identify the major decision areas: goals, constraints, data flow, failure modes, dependencies, rollout, validation.

Do not ask the user to re-explain what you can read yourself.

### 2. Build The Decision Tree

Map the decisions that need to be validated. Common areas to cover:

**For product or feature designs:**
- Problem definition and target user
- Success metric and how it will be measured
- MVP scope vs. full vision
- Edge cases and failure states
- Rollout and reversibility
- Instrumentation and observability
- Dependencies on external systems or teams

**For architecture or technical designs:**
- Component boundaries and responsibilities
- Data model and ownership
- API contracts and versioning
- Failure modes and recovery
- Consistency, latency, and scaling constraints
- Migration path from current state
- Testing and observability strategy
- Operational burden

**For implementation decisions:**
- Fit with existing patterns in the codebase
- Risk surface introduced
- Test coverage for the changed behavior
- Reversibility of the change
- Performance and resource implications

### 3. Interrogate Sequentially

Work through the decision tree one question at a time:

- Lead with the most load-bearing decision — the one that invalidates the most downstream choices if wrong.
- When the answer to one question opens a new branch, follow it before moving on.
- Offer a recommended answer when you have enough signal to form one. Mark it clearly.
- If the user's answer reveals a gap or contradiction, name it directly and ask the follow-up.

Format each question as:

> **[Topic]:** [Question]
>
> Recommended: [your recommendation, or "no strong preference" if genuinely unclear]

### 4. Surface Findings

After covering all material decision points, summarize what was learned:

- Decisions that are solid and well-reasoned
- Assumptions that were validated
- Risks or gaps that remain open
- Items that need a decision before proceeding

Keep the summary compact. Use bullets, not prose.

### 5. Close Or Continue

Ask whether the user wants to proceed to implementation, revise the plan, or dig deeper into any open item.

If the user wants to revise: re-enter the interrogation at the point where the revision affects downstream decisions. Do not restart from scratch.

If the user approves and moves to implementation: the git-workflow rules apply — keep changes scoped, suggest a commit when the domain shifts, and do not commit without being asked.

## Quality Bar

Before wrapping up, check:

- Were all major decision areas covered?
- Were contradictions or gaps named explicitly, not glossed over?
- Did every question have a clear dependency reason for being asked?
- Was the recommended answer based on inspected context, not guesswork?
- Is the summary actionable?

## Behavior To Avoid

- Do not offer open-ended brainstorming when the user wants challenge, not options.
- Do not ask multiple questions at once.
- Do not accept vague answers without a clarifying follow-up.
- Do not skip a hard question because the user seems confident.
- Do not produce a long report at the start — interrogate first, summarize at the end.
