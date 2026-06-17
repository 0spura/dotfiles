---
name: brainstorming
description: "Use before building a feature or defining a system: explore workflows, module boundaries, tech direction, edge cases, and behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
---

# Brainstorming

**When to use:** User wants to explore how something should work before building. Trigger: "how should we approach", "brainstorm", "let's think through", "before I build", "help me design".

**Goal:** Converge on a design the user approves before any implementation starts.

**Scopes:**
- **System:** overall architecture, module boundaries, tech stack, cross-cutting concerns, feature sequencing. Use when starting a new product or making a large structural decision. Saves to `docs/product/system-design.md`.
- **Feature:** how a specific feature or integration should work. Saves to `docs/features/<feature-name>/design.md`.

**Constraints:**
- If no product context exists (competitors, market position, ICP), suggest **product-discovery** first.
- No implementation, code scaffolding, or file edits during brainstorming.
- Stay within the stated scope. Do not expand the problem or surface adjacent concerns unless asked.
- One question at a time. Use multiple-choice when it helps.
- No diagrams or visual output unless explicitly asked.
- Inspect the repo before asking questions the code answers.

**Process:**
1. Read relevant code, docs, and existing patterns.
2. Clarify only if a missing piece would materially change the direction. If scope is already clear, skip.
3. If the user pointed to a direction, explore it — don't offer alternatives for completeness. Only present 2-3 options when the decision is genuinely open.
4. Present a design using only the sections that fit the scope (see templates below).
5. Get approval. Revise if needed.
6. Save the approved design to the path that matches the scope.

**Feature design template** → `docs/features/<feature-name>/design.md`:

```markdown
# Design — [Feature Name]

## Problem
What is broken or missing and who feels it.

## Core Use Case
The primary scenario this design addresses.

## MVP Scope
What is included in the first version.

## Non-Goals
What this design explicitly does not cover.

## User Flow
Step-by-step: how a user accomplishes the core use case.

## Risks
What could go wrong or invalidate this design.

## Next Steps
Immediate actions after approval.
```

**System design template** → `docs/product/system-design.md`:

```markdown
# System Design — [Product Name]

## Vision
What this system is and what problem it solves at the macro level.

## Modules
The main parts of the system, what each owns, and how they relate.

## Tech Direction
Language, framework, database, infra — and why. High-level only; details go in docs/project.md.

## Cross-Cutting Concerns
Auth strategy, data model philosophy, API style, observability approach.

## Feature Roadmap
Which features belong to which modules. Sequencing and dependencies between them.

## Principles
Non-negotiable architectural constraints that every decision must respect.

## Open Questions
Decisions not yet made that will materially affect the system shape.
```

**Done when:** Design saved and approved.
- System scope → suggest **architecture-design** to produce `docs/project.md` and then plan features.
- Feature scope → suggest **srs** to formalize requirements. For very small scopes where requirements are already unambiguous, suggest **architecture-design** directly.
