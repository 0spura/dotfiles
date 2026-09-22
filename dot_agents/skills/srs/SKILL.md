---
name: srs
description: Convert an approved product or feature design into a versioned, observable, testable software requirements specification before architecture design.
---

# SRS

The SRS specifies what the system must do and how that behavior is accepted. UI flows stay in `docs/design/`, technical realization in `docs/architecture.md`, and durable decisions in an `adr` record.

## Workflow

1. Read the product principles and existing requirements; resolve a contradiction before writing.
2. Define actors, use cases, constraints, non-goals, and stable domains.
3. Give every active requirement a stable ID (`RF-XXX.N`, `RNF-XXX.N`), priority, dependencies, measurable acceptance, independent verification evidence, and edge limits. Add IDs when requirements need external traceability.
4. Use `skill://srs/reference/template.md` for an initial document.
5. Check each requirement against the scope boundary, and confirm a tester can verify it without a follow-up question.
6. Ask for approval when a requirement contradicts product principles, existing requirements, or a costly decision.

## Size and structure

Keep one `docs/srs.md` while it stays under roughly 500 lines and 6 top-level sections; beyond that it becomes an index and each domain moves to `docs/requirements/<domain>.md` with its IDs intact. Superseded text never stays in the active contract: Git holds the history, and an external reference keeps only a compact old-ID mapping.

## Output

The active contract, its verification boundaries, and open decisions.
