---
name: implementation
description: "Use after implementation work items are approved: execute one unblocked item at a time with branch/worktree isolation, tests, verification, commits, and tracker updates."
---

# Implementation

Use this skill to implement approved tracker work items, one unblocked item at a time. Engineering defaults, git conventions, and living-documentation rules always apply — this skill covers only what is specific to executing a tracked item.

## Method

Two disciplines at different layers — keep them distinct, do not collapse one into the other:

- **SDD (system layer):** the SRS, architecture, and ADRs are the source of truth. Do not drift from them; if the code must diverge, update the spec first (SRS, architecture, or a new ADR), then implement.
- **TDD (task layer):** write or update the item's focused test before implementing, asserting observable behavior. A passing test that contradicts the spec means the test is wrong, not the spec.

**Refactors** (no new RF-XXX): done when all previously passing tests still pass and observable behavior is unchanged. Do not introduce new requirements or behavior changes in a refactor scope — if a behavior change is needed, scope it as a separate item.

## Git Isolation

- One branch per feature, normally `feat/<feature-slug>`. Link it to the parent work item through the tracker MCP before starting — use whatever branch-linking it exposes, without assuming a provider.
- Do not branch per child item or task.
- Use a worktree when the checkout is dirty, work is parallel, or switching would need a stash. Never nest worktrees.

## Execution

1. Select the next open child item under the parent feature by tracker Status, Priority, and relationships. Prefer `Ready`; skip anything blocked.
2. Check `git status --short`; switch to the linked feature branch/worktree before editing.
3. Before creating a file, declare its path and single responsibility. If it would own more than one domain concern, propose the split and wait for approval.
4. Write or update the focused test. If the item has no testable behavior (infra, env, migration), state why instead of skipping silently.
5. Implement until verification passes. If it still fails after a few focused attempts and the cause is unclear, stop and report the failing state with your hypothesis — switch to **debug** for defects in existing behavior.
6. Run the item's verification command and the static checks before committing.
7. Review the diff, update any spec the change diverged from, and commit the item.
8. Mark the current item done/closed in the tracker and record the commit/verification evidence before moving on. Update any blockers or relationships.
9. Move to the next unblocked item.

## Done When

The item is implemented, verified, committed, and updated in the tracker. When all approved items for the feature are complete, use the **pull-request** skill.
