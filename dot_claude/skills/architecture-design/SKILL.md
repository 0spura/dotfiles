---
name: architecture-design
description: "Use after system-design is approved (system scope) or after SRS is approved (feature scope): define how requirements will be implemented — data model, integration patterns, security model, failure modes, and technical contracts before coding."
---

# Architecture Design

Goal: a clear technical contract that answers *how* something will be implemented. Not a large document — only the decisions that aren't obvious from the code.

The SRS defines the *what*. This skill defines the *how*. Do not rewrite or expand requirements here; reference them by ID. If a requirement is unclear, go back to the SRS before designing.

Prefer the simplest design that satisfies the stated requirements. Be skeptical of new services, abstractions, queues, event buses, and generic layers unless they solve a concrete problem stated in a requirement.

## Scopes

This skill has two distinct scopes with different inputs, outputs, and section sets:

**System scope** — overall technical contract for the entire product. Use after `docs/product/system-design.md` is approved. Saves to `docs/architecture.md`. Does NOT include a Stack section (lives in `docs/project.md`) or a Boundaries section (lives in `docs/product/system-design.md`).

**Feature scope** — technical contract for a specific feature. Use after the feature's SRS is approved. Saves to `docs/features/<feature-name>/architecture.md`. References `docs/project.md` and `docs/architecture.md` instead of repeating global decisions.

Identify the scope before doing anything else.

## Process

### 1. Establish Foundations

**Always do this first:**
- If `docs/project.md` does not exist → create it before anything else. It covers stack, global constraints, repo structure, and environments. Everything else inherits from it.
- Read `docs/product/system-design.md` if it exists — approved module and tech direction decisions are settled. Do not relitigate them.
- For feature scope: read the feature's SRS and `docs/architecture.md`.
- Read existing ADRs in `docs/adr/`.

**Check what's already documented before writing any section.** If a decision is in project.md, system-design.md, or an ADR, reference it — do not repeat it.

### 2. Identify Open Decisions

Before drafting, list the decisions that are not yet settled and that materially affect implementation. For each:
- What are the viable options?
- What is the recommended option and why?
- What assumption does it rest on?

Present these to the user **before drafting the full document**. Resolve each one. Do not draft a document around unresolved decisions — the document will need to be rewritten.

For non-trivial decisions, use this format:

| Option | Best for | Tradeoff | Risk |
|---|---|---|---|
| A | ... | ... | ... |
| B | ... | ... | ... |

### 3. Extract Business Rules (feature scope only)

For feature-level architecture, identify rules the implementation must preserve:
- Calculations, thresholds, limits, rounding
- Validations and cross-field constraints
- Lifecycle states and allowed transitions
- Retry limits, cutoff times, retention periods

Skip infrastructure-only details. Format rules only when the logic is non-obvious:

```
Rule: [name]
Source: [RF-XXX.N]
Given / When / Then: [concrete behavior]
Parameters: [values]
```

### 4. Produce The Architecture Document

Write only sections that add information not already in project.md, system-design.md, or an existing ADR.

**System scope** → `docs/architecture.md`:

```markdown
# Architecture — [Product Name]

> Stack: [docs/project.md](./project.md)
> System design: [docs/product/system-design.md](./product/system-design.md)

## Data Model
Entities, relationships, and key fields — on-device and backend separately if both exist.
Enough to implement without ambiguity. Not a full ERD.

## Integration Patterns
Protocols, sync strategy, conflict resolution, retry policy, failure handling.
Do not document field-level API contracts — those live in code.

## Security Model
Auth mechanism, permission model, trust boundaries, data sensitivity classification,
consent model for sensitive data.

## Deployment
Where each component runs, how it scales, CI/CD flow per component.

## Failure Modes
What fails, how it fails, user impact, system behavior, recovery path.
```

**Feature scope** → `docs/features/<feature-name>/architecture.md`:

```markdown
# Architecture — [Feature Name]

> Project foundation: [docs/project.md](../../project.md)
> System architecture: [docs/architecture.md](../../architecture.md)
> SRS: [docs/features/<name>/srs-document.md](./srs-document.md)

## Data Model Changes
New entities or changes to existing ones. Reference existing tables by name — do not redefine them.

## Business Rules
Non-obvious rules the implementation must preserve, traced to SRS requirement IDs.

## Integration Patterns
Any patterns specific to this feature that differ from or extend the system-level patterns.

## Security Considerations
Anything this feature adds to the security model — new trust boundaries, new sensitive data, new permissions.

## Failure Modes
What this feature adds to the failure surface.
```

### 5. Self-Critique Before Saving

- Does every section add information not already in project.md or system-design.md?
- Is this simpler than the obvious overbuilt version?
- Does every boundary or service separation have a concrete reason?
- Can a dependency failure be traced end to end?
- Are business rules preserved?
- Are missing or optional values represented explicitly — never silently defaulted?

If a major weakness remains, call it out explicitly. Then suggest **grill-me**.

### 6. Save And Document Decisions

Save the document. Then identify decisions that are costly to reverse: data ownership, public API contracts, auth posture, infrastructure choices, migration strategy. Use the **adr** skill to record each one.

After the architecture is approved:
- System scope → suggest **grill-me** before feature work begins
- Feature scope → suggest **implementation-plan** to sequence the work
