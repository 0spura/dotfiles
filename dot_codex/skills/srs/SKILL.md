---
name: srs
description: Convert an approved product or feature design into a versioned, observable, testable software requirements specification before architecture design.
---

# SRS

The SRS specifies what the system must do. Keep UI flows in `docs/design/`, technical realization in `docs/architecture.md`, and costly decisions in ADRs.

## Workflow

1. Read product principles and existing requirements. Resolve a contradiction before writing.
2. Define actors, use cases, constraints, non-goals, and stable domains.
3. Add permanent functional IDs as `RF-XXX.N` and non-functional IDs as `RNF-XXX.N`. Give every requirement priority, status, dependencies, measurable acceptance, and edge limits.
4. Preserve deprecated IDs using strikethrough and a deprecation note; never renumber them.
5. For an initial document, use [reference/template.md](reference/template.md). Split only when the index becomes hard to scan.
6. Check each requirement against the scope boundary and confirm that a tester can verify it without a follow-up question.
7. Ask for approval when a requirement contradicts product principles, existing requirements, or a costly decision.

## Size and structure check

Before saving, count lines and top-level sections. Keep a single `docs/srs.md` while it remains at or below approximately 500 lines and 6 top-level sections. When either threshold is exceeded, keep `docs/srs.md` as a scannable index and move domain content to `docs/requirements/<domain>.md`. Preserve every requirement ID, link, status, and deprecation note during the split.

Save `docs/srs.md`, write its durable memory summary, and route technical design to `architecture-design`. Do not invent behavior to fill missing product decisions.
