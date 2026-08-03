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

1. Read `docs/product/vision.md` if present. Its Principles and Anti-goals are absolute, so a decision that violates one is a blocking issue, not a trade-off. Start there if any violation exists.
2. Derive the decision areas that matter from the artifact itself and the Principles, not a fixed checklist.
3. Start with the most load-bearing decision, the one that invalidates the most downstream choices if wrong, and follow its branch. Format each question:
   > **[Topic]:** [Question]
   >
   > Recommended: [recommendation, or "no strong preference"]
4. When an answer surfaces a new contradiction, dependency, or principle violation, re-enter step 3 there automatically until nothing new surfaces.
5. Summarize: decisions solid, assumptions validated, risks or gaps still open, and what needs deciding before proceeding.
6. Ask whether to proceed, revise, or dig deeper. On revision, re-enter at the affected point rather than restarting.

## Memory integration

Query ai-memory before starting for prior decisions and constraints on this project:

```
@ai-memory/memory_query
  namespace: decisions
  query: <project-name OR decision area keywords>
```

After completion, write the decisions surfaced:

```
@ai-memory/memory_write_page
  namespace: decisions
  page_title: decisions/<project>/<decision-slug>
  content: [decisions made, alternatives rejected, risks accepted, constraints surfaced]
```

## Done When

Every material decision point is covered and the user approves. Suggest **implementation-plan** to sequence the work.
