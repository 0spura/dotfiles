---
name: grill-me
description: "Stress-test an existing plan, design, or decision by systematically interrogating every decision point until a shared understanding is reached."
whenToUse: "Use before costly-to-reverse decisions or when a design feels under-specified. Stop when the design survives the questions or when gaps force a return to brainstorming or architecture-design."
---

# Grill Me

Pressure-test a plan, design, or decision. Ask one question at a time. The goal is not to win; it is to find the gaps that will matter in implementation.

## When to run

- Costly-to-reverse decisions: architecture boundaries, public APIs, data models, auth models, deployment topology.
- A design that skipped alternatives or tradeoffs.
- Before implementation-plan when the stakes are high.

## Process

1. Read the artifact to test: `docs/product/vision.md`, `docs/srs.md`, `docs/architecture.md`, or an ADR.
2. Identify the load-bearing decisions: assumptions, constraints, tradeoffs, and interfaces. Skip a question memory already answered unless new evidence exists.
3. For each decision, ask:
   - What would make this wrong?
   - What evidence supports it?
   - What alternatives were rejected and why?
   - What happens at the edges (failure, scale, misuse, change over time)?
4. Stop when the artifact is solid or when the user agrees on the gap to fix.

## Output

A concise record of what was tested, what held, and what needs fixing. If gaps are found, route back to the right step: brainstorming for scope issues, srs for requirement gaps, architecture-design for technical gaps.
