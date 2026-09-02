---
name: code-craft
description: Execute one approved code-changing task with tight scope, specification alignment, focused verification, and a reviewable commit. Use for features, bug fixes, refactors, performance work, and review fixups.
---

# Code Craft

## Execution and proof

Consume the approved SDD contract produced by requirements and planning. Implement one bounded change and prove it at a public seam. Passing tests is necessary, not sufficient: compare the final behavior with the requirement.

1. Read the item and only its referenced SRS, architecture, and decisions. Stop for an ambiguous contract or missing verification.
2. Choose the caller-visible seam. For new behavior, write a failing test from an independent acceptance criterion; for refactors, establish a baseline.
3. Make the smallest vertical change. Test boundary/failure classes and keep unrelated behavior frozen.
4. Run focused tests and the closest applicable static, integration, and smoke checks.
5. Audit every acceptance criterion against independent evidence and inspect the public behavior for untested assumptions.
6. Review operational/security effects only when the change touches them; do not add ceremony or logs without a diagnostic purpose.
7. Inspect the staged diff, synchronize affected docs, and commit conventionally.

## Stop conditions

Stop and return the decision needed when the task leaves a module boundary, public contract, security choice, or data migration unresolved. Stop and report a pre-existing blocking defect instead of patching around it.

## Done when

The scoped behavior is implemented, focused verification and the closest static checks pass, the diff contains no unrelated changes, specifications are synchronized, and the commit is reviewable.

Return the result, evidence, user-relevant artifacts changed, incidental findings, and commit. Do not include skill names, internal instruction paths, or raw build logs.

If the task has no testable behavior, state why and run the narrowest applicable check. Do not fix adjacent bugs, clean up unrelated code, or hide a failed verification behind a passing subset.

A test is invalid when its assertion recomputes the production procedure, repeats a production constant without an independent source, or verifies private collaboration instead of caller-visible behavior. When no public seam can express the behavior, stop and return the missing design decision instead of cementing an internal test.

For a dirty workspace, leave unrelated changes untouched; use an isolated worktree only when the task is large and isolation is necessary. Never nest worktrees. Commit only the requested logical change after reviewing the staged diff for debug code, commented-out code, secrets, and unrelated files.
