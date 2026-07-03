---
name: project-audit
description: "Use when arriving at an existing codebase that has no docs or stale docs: read the project, derive its current state, and produce the minimal doc set so the rest of the pipeline can function."
allowed-tools: Read, Grep, Glob, Bash, Write, Edit
---

# Project Audit

Use when the project already exists but `docs/` is missing, incomplete, or diverged from the code. Goal: produce the minimal doc set that the rest of the pipeline (`brainstorming`, `srs`, `architecture-design`, `implementation-plan`) needs to function — without over-documenting what does not yet exist or cannot be derived from the code.

Do not use to bootstrap a new project from scratch — start with **product-discovery** instead.

## What to produce

| Doc | Produce when |
|---|---|
| `docs/project.md` | Always — stack, repo structure, environments, tooling, build/test commands |
| `docs/architecture.md` | The project has enough structure to describe (services, data model, key flows) |
| `docs/srs.md` sketch | Observable behaviors exist that are not yet captured as requirements |
| `docs/product/vision.md` sketch | Product intent can be inferred from the code, README, or user description |

Never fabricate — if something cannot be derived from the code, the README, git history, or the user, mark it explicitly as `<!-- TBD: not derivable from current state -->`.

## Process

1. Read the directory tree, README, existing docs, CI config, and dependency manifests. Note what stack, environments, and build/test commands are already defined.
2. Read the git log to understand the main areas of recent activity and the current state of the codebase — not to document history, but to know what is actively maintained.
3. Identify what docs already exist. For each: is it current, stale, or missing? State this clearly before writing anything.
4. Derive the current architecture: what exists (services, modules, data model, key integrations) not what was planned. Describe what the code does, not what it was supposed to do.
5. Identify observable behaviors that look like requirements — these become the seed of `docs/srs.md`. Do not write full RF-XXX blocks unless the behavior is clear; use `- [ ] [behavior to confirm]` for anything uncertain.
6. Write or update each doc in scope. Read `reference/templates.md` for the format of each.
7. List what is missing and could not be derived — these are open questions for the user, not blanks to fill with guesses.

## Done When

`docs/project.md` exists and is current. Any other doc in scope is written or updated. Open questions are listed explicitly. Suggest the appropriate next skill based on what is missing: **brainstorming** if product direction is unclear, **srs** if requirements need formalizing, **architecture-design** if the architecture needs decisions, or **implementation-plan** if the codebase is understood and work items are needed.
