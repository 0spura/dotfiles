---
name: implementation-plan
description: "Use after architecture is approved and grill-me is done: break the design into ordered phases, tasks, and dependencies before writing code."
---

# Implementation Plan

Use after the architecture is approved and pressure-tested. Goal: a concrete execution sequence — what to build first, in what order, and why — so that coding starts with a clear map rather than improvisation.

Do not start implementing. This step is about sequencing, not building.

## Documents

- `docs/roadmap.md` — feature sequencing for the whole product. Created once, updated as the backlog evolves. Use when planning which feature to build next.
- `docs/plan.md` — active implementation plan for the current feature. Replaced when a new feature starts. Git history preserves old plans.

## Methodology

- **SDD at the system level:** the approved architecture contract is the spec. Each phase must stay within its boundaries. Architectural drift must be caught before it merges.
- **TDD at the task level:** within each task, write the test first. Tasks without passing tests are not done.

Execution order for every task: **spec → test → implement → commit**.

## Process

1. Determine what is needed: roadmap update, new plan, or both.
2. Read `docs/architecture.md` and relevant RF-XXX sections in `docs/srs.md`. Do not revisit decisions — treat them as settled input.
3. Name the riskiest parts first: technical unknowns, business rule complexity, external dependencies. These go into Phase 1, not deferred.
4. Break into ordered phases. Each phase must:
   - Be independently testable in isolation
   - Leave the system in a working state — no half-built features blocking everything else
   - Have a concrete definition of done
5. Break phases into tasks. See task format below.
6. Save and present the plan.

## Task Format

Each task:
- Named as an action ("implement X", "add Y", "wire Z to W") — not a noun
- Small enough to complete and commit in one sitting
- Referenced to an SRS requirement when one exists: `implements [RF-XXX.N](./srs.md#rf-xxxn)`
- Has an explicit "verify with" — the test or observable behavior that proves it works
- Has an exit condition — if the agent cannot pass verification after N attempts, stop and report the blocker instead of looping indefinitely
- Has explicit dependencies

```markdown
- [ ] [action] — implements [RF-XXX.N] — verify with: [test or observable behavior] — exit after: 3 failed attempts
```

## Templates

**`docs/roadmap.md`:**

```markdown
# Roadmap — [Product Name]

- Date: YYYY-MM-DD
- SRS: [docs/srs.md]
- Architecture: [docs/architecture.md]
- Status: In Progress | Complete

## Phase 1 — [Name]

Goal: [what this phase proves or enables]
Done when: [concrete, verifiable condition]

- [ ] [feature name] — depends on: [features or —] — verify with: [acceptance criteria from SRS]

Risks: [what could block or invalidate this phase]
```

**`docs/plan.md`:**

```markdown
# Plan: [Feature Name]

- Date: YYYY-MM-DD
- SRS requirements: [RF-XXX.N, RF-YYY.N — links to docs/srs.md]
- ADRs: [docs/adr/NNNN-*.md — or "—" if no architecture decisions are tied to this plan]
- Testing tools: [e.g. "Unit: jest, E2E: playwright"]
- Status: In Progress | Complete

## Phase 1 — [Name]

Goal: [what this phase proves or enables]
Done when: [concrete, verifiable condition]

- [ ] [action] — implements [RF-XXX.N] — verify with: [test or behavior] — exit after: 3 failed attempts

Risks: [what could block or invalidate this phase]
```

## Execution Pattern

After the plan is approved, implementation proceeds task by task — not all at once:

1. Read `docs/plan.md` to find the next unchecked task.
2. Write the test for this task only (it fails) — do not generate tests for future tasks.
3. Implement until the test passes. If verification still fails after the exit limit, stop and report the blocker.
4. If the implementation diverged from `docs/architecture.md` or `docs/srs.md`, update those files now — before committing. A commit that changes behavior without updating the relevant doc is incomplete.
5. Mark the task done: `- [x]`.
6. Commit — one task, one commit (code + doc updates together).
7. Move to the next task.

When all tasks in a phase are checked, mark the phase complete. Run `/code-review` from a fresh context before starting the next phase — a reviewer without knowledge of the implementation's reasoning catches issues the implementing agent is biased to miss.

## Done When

Plan saved and approved. Implementation begins task by task.
