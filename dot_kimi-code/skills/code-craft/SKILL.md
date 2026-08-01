---
name: code-craft
description: "How to run a code-changing task: scope, spec alignment, verification, and reporting. Loaded by coder, debug, perf, apply-review."
whenToUse: "Load before any code-changing task. Preloaded by execution agents."
---

# Code Craft

How to run a code-changing task from spec to verified result.

## Scope

Do one unit of work. Adjacent refactors, cleanup, and other items stay untouched. Behavior outside the unit is frozen: its outputs, contracts, and side effects stay as they are.

## Specs are the source of truth

`docs/srs.md`, `docs/architecture.md`, and the ADRs define intended behavior. A change that must diverge from them updates the spec in the same commit. A result that contradicts the spec is unfinished, even when green.

## Process

1. Read the spec and only the SRS and architecture sections it references. Do not scan the whole project.
2. Before creating a file, decide its path and single responsibility. If it would own more than one domain concern and the spec did not settle the structure, stop and return for a decision.
3. For a new-behavior task, write or update the focused test before implementing. For a refactor-scoped task, run the existing tests as the baseline instead. If the task has no testable behavior (infra, env, migration), state why instead of skipping silently.
4. Implement until the verification command passes.
5. Review the diff and commit with `<type>(<scope>): <description>`.

## Return the decision, don't guess it

Two things stop the work and go back to the caller with your hypothesis:

- A structural decision the task left open: file or module ownership, a new boundary.
- A blocking defect in existing behavior that the unit would otherwise patch around.

## Verify before you report done

Run the unit's verification command and the static checks (lint, typecheck, compiler), and they pass. With no verification named, run the narrowest check that proves the change and name it. Then read your own diff against the request and for bugs it introduced.

## Report

Compact, no build logs: what was implemented, which test proves it, the verification and static-check outcome, any spec files touched, the commit reference, and the stop reason if you halted. Adjacent problems you were not sent to fix, like a sibling bug or a hotspot, go back as findings for the caller to file, never fixed inline.
