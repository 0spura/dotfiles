---
name: srs
description: Convert an approved product or feature design into a versioned, observable, testable software requirements specification before architecture design.
---

# SRS

Specify **what** the system must do and **how** a tester independently verifies it — never **how** it is implemented internally.

Use `skill://srs/reference/template.md` when initializing a new specification.

## House rules

1. **Behavior, never internals.** Describe caller-visible behavior and edge limits; never bind a requirement to file paths, classes, or line numbers (evidence links may still cite files).
2. **Stable IDs + observable oracle.** Every active requirement has a stable ID (`RF-XXX.N` or `RNF-XXX.N`) and a concrete verification method (test, command, or direct observation with expected result).
3. **Separate `Specified` from `Implemented`.** A requirement stays `Specified` until its named verification exists and actually passes.
4. **Zero ambiguity.** A tester must be able to write a pass/fail check from the requirement without asking a follow-up question.
5. **No superseded clutter.** Remove superseded text from the active contract (Git holds history; keep only a compact old-ID mapping if needed).

## Required fields per requirement

| Field | Rule |
| --- | --- |
| **ID** | Stable `RF-XXX.N` (functional) or `RNF-XXX.N` (non-functional); never reuse a retired ID. |
| **Priority & dependencies** | Explicit priority and upstream requirement/system dependencies. |
| **Acceptance & edge limits** | Measurable outcome plus explicit boundary/rejection behavior. |
| **Verification** | Named test, command, or observable check with expected result. |
| **Status** | `Specified` until verification passes, then `Implemented`. |

## Workflow

1. **Resolve contradictions first.** Compare the approved design against existing requirements and product principles; escalate conflicts for user approval before writing.
2. **Define boundaries.** State actors, use cases, constraints, non-goals, and stable domains.
3. **Write testable requirements.** Fill all table fields above. Reference user flows (`design-principles`), architecture (`architecture-design`), and decisions (`adr`) instead of duplicating them.
4. **Keep navigable.** Use one `docs/srs.md` while scannable; split large domains into `docs/requirements/<domain>.md` indexed from `docs/srs.md` with IDs intact.
5. **Hand off cleanly.** Pass requirement IDs, acceptance criteria, verification methods, and open decisions to `architecture-design` / `implementation`.

## Checklist

- [ ] Every requirement has a stable ID, measurable acceptance, edge limits, and an observable verification method.
- [ ] Zero implementation internals (file paths/classes) leaked into requirement definitions.
- [ ] All contradictions with existing requirements or principles surfaced for approval.
- [ ] No requirement prematurely marked `Implemented`.

## Never

- Write vague requirements ("fast", "user-friendly", "scalable") without measurable thresholds.
- Duplicate UI flows or architecture diagrams inside the SRS.
- Open a separate tracker ticket just for writing requirements.

## Output

Active SRS path(s), requirement IDs with verification boundaries, and open decisions.
