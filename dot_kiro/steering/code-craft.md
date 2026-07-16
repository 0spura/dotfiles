# Code Craft

## Scope

Do one unit of work. Adjacent refactors, cleanup, and other items stay untouched. Behavior outside the unit is frozen: its outputs, contracts, and side effects stay as they are.

## Specs are the source of truth

`docs/srs.md`, `docs/architecture.md`, and the ADRs define intended behavior. A change that must diverge from them updates the spec in the same commit. A result that contradicts the spec is unfinished, even when green.

## Return the decision, don't guess it

Two things stop the work and go back to the caller with your hypothesis:

- A structural decision the task left open: file or module ownership, a new boundary.
- A blocking defect in existing behavior that the unit would otherwise patch around.

## Verify before you report done

Run the unit's verification command and the static checks (lint, typecheck, compiler), and they pass. With no verification named, run the narrowest check that proves the change and name it. Then read your own diff against the request and for bugs it introduced.

## Report

Compact, no build logs: the verification and static-check outcome, any spec files touched, and the stop reason if you halted. Adjacent problems you were not sent to fix, like a sibling bug or a hotspot, go back as findings for the caller to file, never fixed inline.
