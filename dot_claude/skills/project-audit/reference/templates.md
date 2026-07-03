# Project Audit — Doc Templates

Minimal formats for each doc. Write only what can be derived from the current state of the project; mark the rest as `<!-- TBD -->`.

---

## docs/project.md

```markdown
# Project — [Name]

## Stack
Languages, frameworks, runtimes, and key libraries.

## Repo Structure
Top-level directories and their purpose. One line each.

## Environments
| Env | Purpose | Notes |
|---|---|---|

## Build & Test
Commands to build, test, lint, and run the project locally. Exact commands, not descriptions.

## External Dependencies
Third-party services, APIs, or infrastructure the project relies on.
```

---

## docs/architecture.md

Derived from code — describes what exists, not what was designed.

```markdown
# Architecture — [Name]

> Stack: [docs/project.md](./project.md)

## Components
What runs and what it does. One paragraph per component or service.

## Data Model
Key entities and relationships. Enough to understand the domain — not a full ERD.

## Key Flows
The most critical or complex paths through the system. Trace from input to output.

## Integration Points
External systems the project talks to and how (protocol, sync/async, failure handling).

## Security Model
Auth mechanism and trust boundaries, as they exist in the code.
```

---

## docs/srs.md (sketch)

Derived from observable behavior — mark uncertain items explicitly.

```markdown
# SRS — [Name] (derived from existing code)

> Status: derived from audit — requires review and approval before use in planning.

## Context
What the system does today, in 2–4 sentences.

# 1. Functional Requirements

## RF-XXX: [Domain]

### RF-XXX.1: [Behavior name]
**Priority:** — | **Status:** Draft | **Dependencies:** —
* [Observable behavior derived from code]
* <!-- TBD: confirm with user -->
```

---

## docs/product/vision.md (sketch)

Only when intent can be inferred. Otherwise leave for **brainstorming** to produce.

```markdown
# Vision — [Name] (inferred)

> Status: inferred from code and README — requires review and approval.

## Purpose
[Inferred from README, code, or user description]

## Users
[Inferred target user — mark as unverified if guessed]

## Principles
[Any hard constraints visible in the code — e.g. "offline-first", "no third-party data"]

## Open Questions
- [ ] [What could not be inferred and needs the user to answer]
```
