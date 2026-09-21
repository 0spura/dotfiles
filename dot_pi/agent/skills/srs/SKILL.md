---
name: srs
description: Convert an approved product or feature design into a versioned, observable, testable software requirements specification before architecture design.
---

# SRS

The SRS is the SDD contract: it specifies what the system must do and how that
behavior can be accepted. Read the active issue; create separate requirements
work only when it is independently approved or blocks delivery. Keep UI flows in
`docs/design/`, technical realization in `docs/architecture.md`, and costly
decisions in `ai-memory`.

## Workflow

1. Read product principles and existing requirements. Resolve a contradiction before writing.
2. Define actors, use cases, constraints, non-goals, and stable domains.
3. Add stable functional IDs as `RF-XXX.N` and non-functional IDs as `RNF-XXX.N` when requirements need external traceability. Give every active requirement priority, dependencies, measurable acceptance, independent verification evidence, and edge limits. Use status only when it changes how the current contract is interpreted; otherwise omit it.
4. Keep the active SRS clean: do not retain superseded requirement text with strikethrough, duplicate old versions, or turn history into active context. Preserve exact history in Git. If an external reference requires ID continuity, record only a compact old-ID → replacement/removal mapping in a change log or durable ai-memory decision; never renumber an ID that is still externally referenced.
5. For an initial document, use [reference/template.md](reference/template.md). Split only when the index becomes hard to scan.
6. Check each requirement against the scope boundary and confirm that a tester can verify it without a follow-up question.
7. Ask for approval when a requirement contradicts product principles, existing requirements, or a costly decision.

## Size and structure check

Before saving, count lines and top-level sections. Keep a single `docs/srs.md` while it remains at or below approximately 500 lines and 6 top-level sections. When either threshold is exceeded, keep `docs/srs.md` as a scannable index and move domain content to `docs/requirements/<domain>.md`. Preserve active requirement IDs and links during the split; keep supersession history outside the active contract.

Save `docs/srs.md`, write its durable memory summary, and return the active
contract, verification boundaries, and open decisions to the caller. Route
technical design to `architecture-design`. Do not
invent behavior to fill missing product decisions.
