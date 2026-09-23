---
name: srs
description: Convert an approved product or feature design into a versioned, observable, testable software requirements specification before architecture design.
---

# SRS

The SRS specifies what the system must do and how that behavior is accepted. Keep user-flow design, technical realization, and durable decisions in their respective artifacts; reference them instead of duplicating them in the SRS.

## Workflow

1. Read the product principles and existing requirements; resolve a contradiction before writing.
2. Define actors, use cases, constraints, non-goals, and stable domains.
3. Give every active requirement a stable ID (`RF-XXX.N`, `RNF-XXX.N`), priority, dependencies, measurable acceptance, edge limits, and an observable verification method. Name a test or command when it exists; a direct observation with its expected result also qualifies. Track implementation status apart from approval: a requirement stays `Specified` until its verification exists and passes, and only then becomes `Implemented`. Describe caller-visible behavior rather than binding the requirement to a file path or line number; links to evidence may still name files.
4. Use `skill://srs/reference/template.md` for an initial document.
5. Check each requirement against the scope boundary, and confirm a tester can verify it without a follow-up question.
6. Ask for approval when a requirement contradicts product principles, existing requirements, or a costly decision.

## Size and structure

Keep one `docs/srs.md` while its domains remain easy to navigate; otherwise use it as an index and move each domain to `docs/requirements/<domain>.md` with its IDs intact. Superseded text never stays in the active contract: Git holds the history, and an external reference keeps only a compact old-ID mapping.

## Output

The active contract, its verification boundaries, and open decisions.
