---
name: implementation
description: "Use after implementation work items are approved: execute one unblocked item at a time with branch/worktree isolation, tests, verification, commits, and tracker updates."
---

# Implementation

Use this skill to implement approved tracker work items. Work one unblocked item at a time.

## Method

- Follow SDD: do not drift from SRS, architecture, or ADRs without updating them first.
- Follow TDD: write or update the focused test for the current item before implementation.

## Git Isolation

- Use one branch for the feature, normally `feat/<feature-slug>`.
- Link the feature branch to the parent work item before implementation starts. For GitHub, use the **github** skill.
- Do not create branches per child item or task.
- Use a worktree when the main checkout is dirty, parallel work is happening, or switching would require stashing.
- Do not create nested worktrees.

## Execution

1. Find the parent feature item, then select the next open child item by tracker Status, Priority, and relationships.
2. Prefer Status `Ready`; skip anything blocked by relationships or explicit blockers.
3. Check `git status --short`; create or switch to the linked feature branch/worktree before editing.
4. Write or update the focused test for this item.
5. Implement until verification passes.
6. Run the item's verification command plus lint/static checks before committing.
7. Review `git diff`; update SRS, architecture, or ADR docs if behavior diverged.
8. Commit the completed item or meaningful checklist item with a conventional commit.
9. Update execution state only: Status, commit/verification evidence, and blockers/relationships.
10. Move to the next unblocked item.

## Done When

The item is implemented, linted, verified, committed, and updated in the tracker. When all approved items for the feature are complete, use the **pull-request** skill.
