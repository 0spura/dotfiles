---
name: grill-me
description: "Use when stress-testing, reviewing, or pressure-testing an existing plan, design, or decision. Systematically interrogates every decision point, one question at a time, until a shared understanding is reached."
---

# Grill Me

Use when the user has a plan, design, or decision and wants it thoroughly challenged before committing. The goal is to surface hidden assumptions, weak points, and unresolved dependencies, not to generate alternatives. For generating options, use **brainstorming** instead.

Reserve this for decisions that are expensive to reverse: data model changes, public API contracts, security posture, infrastructure choices. Skip it for small or low-stakes features.

## Constraints

- One question at a time. Include a recommended answer when one is clear.
- Do not ask for information you can read yourself. Inspect the codebase first.
- Navigate the full decision tree. Do not stop early.
- If an answer reveals a gap or contradiction, name it directly and ask the follow-up.

## Process

1. Read `docs/product/vision.md` if it exists. Its Principles and Anti-goals are absolute constraints: any decision that violates one is a blocking issue, not a trade-off to weigh.
2. Read the user's description and inspect relevant codebase context. Derive the decision areas that actually matter for this artifact from the artifact itself and the Principles, not from a fixed checklist. Start from principle violations if any exist.
3. Start with the most load-bearing decision, the one that invalidates the most downstream choices if wrong. Follow each answer's branch before moving on.

   Format each question as:
   > **[Topic]:** [Question]
   >
   > Recommended: [recommendation, or "no strong preference"]

4. After covering the material decision points, check whether any answer revealed a new contradiction, unresolved dependency, or principle violation. If so, re-enter step 3 at those points automatically without waiting to be asked. Repeat until no new issues surface.
5. Summarize: decisions that are solid, assumptions validated, risks or gaps still open, and items that need a decision before proceeding.
6. Ask whether to proceed, revise, or dig deeper into any open item. On revision, re-enter at the affected decision point rather than restarting the full interrogation.

## Done When

All material decision points are covered and the user approves to proceed. Suggest **implementation-plan** to sequence the work.
