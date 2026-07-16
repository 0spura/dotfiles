---
name: grill-me
description: Pressure-test an existing plan, design, or decision, interrogating every decision point one question at a time until hidden assumptions and weak points surface.
---

# Grill Me

Challenge a plan, design, or decision before it is committed. Surface hidden assumptions, weak points, and unresolved dependencies. For generating options instead, use **brainstorming**.

Reserve it for decisions expensive to reverse: data model changes, public API contracts, security posture, infrastructure choices. Small, low-stakes features skip it.

## How to interrogate

- One question at a time, with a recommended answer when one is clear.
- Read the codebase first; ask only what the code cannot answer.
- Navigate the full decision tree, following each answer's branch to its end before the next.
- When an answer reveals a gap or contradiction, name it and ask the follow-up.

## Process

1. Read `docs/product/vision.md` if present. Its Principles and Anti-goals are absolute, so a decision that violates one is a blocking issue, not a trade-off.
2. Derive the decision areas that matter from the artifact itself and the Principles, not a fixed checklist.
3. Start with the most load-bearing decision and follow its branch. Format each question:
   > **[Topic]:** [Question]
   >
   > Recommended: [recommendation, or "no strong preference"]
4. When an answer surfaces a new contradiction or dependency, re-enter step 3 there automatically.
5. Summarize: decisions solid, assumptions validated, risks or gaps still open.
6. Ask whether to proceed, revise, or dig deeper.

## Done When

Every material decision point is covered and the user approves. Suggest **implementation-plan** to sequence the work.
