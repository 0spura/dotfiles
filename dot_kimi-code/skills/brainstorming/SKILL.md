---
name: brainstorming
description: "Explore workflows, module boundaries, tech direction, edge cases, and behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
whenToUse: "Use after product-discovery and before srs, when the problem space needs shaping into an approved design."
---

# Brainstorming

Shape rough ideas into an approved design. Explore options, expose tradeoffs, and decide what to build before anyone writes an SRS.

## Scope

- What the system must do, for whom, and under which constraints.
- Module boundaries and interfaces at the whiteboard level.
- Tech direction and major dependencies.
- Edge cases and failure modes.
- Explicit non-goals.

Out of scope: detailed implementation, full API schemas, UI pixel details, estimates, or project planning. Those come later.

## Process

1. Read `docs/product/discovery.md` if present. Identify the problem, actors, constraints, and principles.
2. Generate at least two genuinely different options. For each, state the shape, the tradeoffs, and the main risk. Do not resurrect an option already rejected in memory without new evidence.
3. Compare options against the principles in `docs/product/vision.md`. An option that violates a principle is discarded, not softened.
4. Recommend one option with a one-paragraph rationale. Flag where the decision is costly to reverse.
5. Save the approved design to `docs/product/vision.md` or update it. Read `reference/vision-template.md` on first write.

## Done When

The design is approved and saved, durable decisions are in memory, with clear options, a chosen path, and documented non-goals. The next step is **srs**.
