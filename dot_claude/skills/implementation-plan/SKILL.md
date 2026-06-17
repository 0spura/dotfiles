---
name: implementation-plan
description: "Use after architecture is approved and grill-me is done: break the design into ordered phases, tasks, and dependencies before writing code."
---

# Implementation Plan

Use after the architecture is approved and pressure-tested. Goal: a concrete execution sequence — what to build first, in what order, and why — so that coding starts with a clear map rather than improvisation.

Do not start implementing. This step is about sequencing, not building.

## Methodology

This plan combines two layers:

- **SDD (Spec-Driven) at the system level**: the approved architecture contract is the spec. Each phase must stay within its boundaries. Architectural drift — features that cross service lines, APIs that break the contract, dependencies not in the approved design — must be caught before they merge, not after.
- **TDD (Test-Driven) at the task level**: within each task, write the test first. Tests are the verification gate that lets the implementation iterate with confidence. Tasks without tests are not done.

Execution order for every task: **spec → test → implement → commit**.

## Process

### 1. Understand The Architecture

Read `docs/features/<feature-name>/architecture.md` and `docs/features/<feature-name>/srs-document.md`. The architecture document defines the technical constraints — stack, boundaries, data model, APIs — that tasks must stay within. The SRS provides `RF-XXX.N` IDs to reference in each task. Do not revisit decisions in either document — treat them as settled input.

### 2. Identify The Riskiest Parts

Before sequencing, name what is most likely to invalidate the plan:
- Technical unknowns (integrations, APIs, data shapes not yet validated)
- Business rule complexity that may be harder than expected
- External dependencies outside the team's control

These go into Phase 1, not deferred. Discovering a failed assumption in Phase 3 after building everything around it is the most common way a plan collapses.

### 3. Sequence Into Phases

Break the work into ordered phases. Each phase must:
- Be independently testable in isolation
- Leave the system in a working state — no half-built features blocking everything else
- Have a concrete definition of done

Ordering principles:
- Foundation before features (data model, core domain, auth before UI)
- Riskiest assumptions before dependent work
- Shared infrastructure before parallel workstreams

### 4. Break Phases Into Tasks

For each phase, list concrete tasks. Each task:
- Named as an action ("implement X", "add Y", "wire Z to W") — not a noun
- Small enough to complete and commit in one sitting
- Referenced to an SRS requirement when one exists, using a markdown link ("implements [RF-HAB.3](./srs-document.md#rf-hab3-frequency)")
- Has an explicit "verify with" — the test or observable behavior that proves it works
- Has explicit dependencies ("requires task 3 complete", "blocked by external API access")

### 5. Save And Produce The Plan

Save the plan to `docs/features/<feature-name>/plan.md` before presenting it. This file is the source of truth across sessions — the agent reads it at the start of each session to resume without re-explaining context. Treat it as a living document: update it when scope changes, not after the fact.

File header:

```markdown
# Plan: [Feature name]

- Date: YYYY-MM-DD
- SRS: [link to docs/features/<feature-name>/srs-document.md]
- Architecture: [link to docs/features/<feature-name>/architecture.md]
- Testing tools: [e.g. "Unit: jest, E2E: playwright"]
- Status: In Progress | Complete
```

Phase format:

```markdown
## Phase 1 — [Name]

Goal: [what this phase proves or enables]
Done when: [concrete, verifiable condition]

- [ ] [action] — verify with: [test or observable behavior]
- [ ] [action] — verify with: [test or observable behavior]

Risks: [what could block or invalidate this phase]
```

### 6. Hand Off

After the plan is approved and saved, implementation begins task by task — not all at once.

Execution pattern per task:
1. Read `docs/features/<feature-name>/plan.md` to find the current plan and locate the next unchecked task
2. Write the test for this task only (it fails) — do not generate tests for future tasks
3. Implement until the test passes
4. If the implementation diverged from `architecture.md` or `srs-document.md`, update those files now — before committing. A commit that changes behavior without updating the relevant doc is incomplete.
5. Mark the task as done in the plan file: `- [x]`
6. Commit — one task, one commit (code + doc updates together)
7. Move to the next task

When all tasks in a phase are checked, mark the phase complete and suggest `/code-review` before starting the next phase.

The spec is the approved architecture contract — do not generate a new spec document. The test suite grows incrementally; never generate it all upfront.
