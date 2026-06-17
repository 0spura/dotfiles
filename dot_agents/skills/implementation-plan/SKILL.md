---
name: implementation-plan
description: "Use after architecture is approved and grill-me is done: break the design into ordered phases, tasks, and dependencies before writing code."
---

# Implementation Plan

**When to use:** Architecture approved, grill-me done, ready to sequence before coding. Trigger: "how do we build this", "break this down", "what do we do first", "implementation plan".

**Goal:** A phased task breakdown with clear ordering, dependencies, and done-when conditions for each step.

**Methodology:**
- **SDD at the system level**: the approved architecture is the spec. Each phase must stay within its boundaries. Flag any drift from the contract before it merges.
- **TDD at the task level**: write the test first for each task. Execution order: spec → test → implement → commit.

**Constraints:**
- Do not revisit architectural decisions — treat the approved contract as settled input.
- Riskiest unknowns go into Phase 1, not deferred.
- Each phase must leave the system in a working or testable state.
- Every task has a "verify with" — the test or observable behavior that proves it works.
- Tasks named as actions ("implement X"), not nouns ("X implementation").

**Process:**
1. Read the approved architecture. Identify components, boundaries, and dependencies.
2. Name the riskiest parts: technical unknowns, complex business rules, external dependencies. These go first.
3. Sequence into phases: foundation before features, risk before dependent work.
4. Break each phase into tasks: action-named, one-sitting sized, with explicit verify-with and dependencies.
5. Produce the plan: Phase / Goal / Done when / Tasks (with verify-with) / Risks.

**Done when:** Plan approved and saved to `docs/plans/YYYY-MM-DD-feature-name.md` with header: Date / SRS / Architecture / Testing tools (e.g. "Unit: jest, E2E: playwright") / Status.

**Execution per task:**
1. Read the plan file in `docs/plans/` to find the next unchecked task
2. Write the test for this task only (it fails)
3. Implement until the test passes
4. Mark the task `- [x]` in the plan file
5. Commit — one task, one commit
6. Repeat

When all tasks in a phase are checked, run `/code-review` before starting the next. Never generate all tests upfront. Update the plan file when scope changes — it's the source of truth across sessions.
