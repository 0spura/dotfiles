---
name: project-audit
description: Use when arriving at an existing codebase that has no docs or stale docs. Reads the project, derives its current state, and produces the minimal doc set so the development pipeline can function.
subagent: true
model: flash
---

Produce the minimal doc set the development pipeline needs from a working directory, deriving every claim from the code rather than fabricating it. Bootstrapping a new product from scratch starts with product discovery instead.

## What to produce

| Doc | Produce when |
|---|---|
| `docs/project.md` | Always |
| `docs/architecture.md` | Project has enough structure to describe (services, data model, key flows) |
| `docs/srs.md` sketch | Observable behaviors exist that are not yet captured as requirements |
| `docs/product/vision.md` sketch | Product intent can be inferred from code, README, or user description |

Never fabricate. Mark anything not derivable as `<!-- TBD: not derivable from current state -->`.

## Process

1. Read the directory tree, README, existing docs, CI config, and dependency manifests.
2. Read the git log to know what is actively maintained, not to document history.
3. Identify what docs already exist and label each current, stale, or missing. State this before writing anything.
4. Derive the current architecture from what the code does, not from what it was supposed to do.
5. Identify observable behaviors that look like requirements to seed `docs/srs.md`. Use `- [ ] [behavior to confirm]` for anything uncertain.
6. Write or update each doc in scope using the templates below.
7. List what could not be derived as open questions for the user, not blanks to fill with guesses.

## Templates

### docs/project.md

```markdown
# Project: [Name]

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

### docs/architecture.md

```markdown
# Architecture: [Name]

> Stack: [docs/project.md](./project.md)

## Components
What runs and what it does. One paragraph per component or service.

## Data Model
Key entities and relationships. Enough to understand the domain, not a full ERD.

## Key Flows
The most critical or complex paths through the system. Trace from input to output.

## Integration Points
External systems the project talks to and how (protocol, sync/async, failure handling).

## Security Model
Auth mechanism and trust boundaries, as they exist in the code.
```

### docs/srs.md (sketch)

```markdown
# SRS: [Name] (derived from existing code)

> Status: derived from audit. Requires review and approval before use in planning.

## Context
What the system does today, in 2 to 4 sentences.

# 1. Functional Requirements

## RF-XXX: [Domain]

### RF-XXX.1: [Behavior name]
**Priority:** TBD | **Status:** Draft | **Dependencies:** none
* [Observable behavior derived from code]
* <!-- TBD: confirm with user -->
```

### docs/product/vision.md (sketch)

Only when intent can be inferred. Otherwise leave it for brainstorming to produce.

```markdown
# Vision: [Name] (inferred)

> Status: inferred from code and README. Requires review and approval.

## Purpose
[Inferred from README, code, or user description]

## Users
[Inferred target user, marked unverified if guessed]

## Principles
[Any hard constraints visible in the code]

## Open Questions
- [ ] [What could not be inferred and needs the user to answer]
```

## Pipeline

Each doc has a skill or agent that owns it. After the audit, point to the right one for every gap:

| Missing or TBD | Use |
|---|---|
| `docs/product/discovery.md` | **product-discovery agent**: market research and positioning |
| `docs/product/vision.md` | **brainstorming** (product scope): philosophy, north star, principles |
| `docs/srs.md` | **srs**: formalize observable behaviors into RF-XXX requirements |
| `docs/architecture.md` | **architecture-design**: define components, data model, and key flows |
| Work items / backlog | **implementation-plan**: break requirements into tracked items |

If multiple docs are missing, suggest starting from the top of the pipeline: discovery, vision, srs, architecture, implementation-plan.

## Return

Which docs were produced or updated, what is still TBD and why, and the exact sequence of skills and agents to run next to fill the gaps, starting from the earliest missing input in the pipeline.
