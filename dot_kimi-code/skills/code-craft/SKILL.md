---
name: code-craft
description: "Execute one approved code-changing task with tight scope, specification alignment, focused verification, and a reviewable commit."
whenToUse: "Use for features, bug fixes, refactors, performance work, and review fixups."
---

# Code Craft

## Workflow

1. Read the item and only the referenced SRS, architecture, and ADR sections. Confirm the implementation surface and verification command.
2. Stop for an unresolved module boundary, security choice, or pre-existing blocking defect. Return the decision needed; do not guess.
3. For new behavior, write or update a focused test first. For a behavior-preserving refactor, run the relevant baseline first.
4. Implement the smallest change in existing patterns. Keep unrelated behavior, contracts, and side effects frozen.
5. Run the item verification and the closest formatter, lint, typecheck, or compiler check. If none is named, select and report the narrowest meaningful check.
6. Inspect the diff, update affected specification documents in the same commit, and commit with a conventional message.

## Stop conditions

Stop and return the decision needed when the task leaves a module boundary, public contract, security choice, or data migration unresolved. Stop and report a pre-existing blocking defect instead of patching around it.

## Done when

The scoped behavior is implemented, focused verification and the closest static checks pass, the diff contains no unrelated changes, specifications are synchronized, and the commit is reviewable.

Return the result, evidence, specification files changed, incidental findings, and commit. Do not include raw build logs.

If the task has no testable behavior, state why and run the narrowest applicable check. Do not fix adjacent bugs, clean up unrelated code, or hide a failed verification behind a passing subset.
