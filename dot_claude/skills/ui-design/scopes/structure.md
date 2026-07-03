# UI Design — Structure Scope

Goal: define the durable interface architecture — navigation, surfaces, and the rules that decide which surface a given interaction uses. Saves to `docs/design/ui-architecture.md`.

A single `docs/design/ui-architecture.md` covers the whole product. When adding a feature, update the affected sections — do not append feature-named sections. Once the file stops being easy to scan, keep it as an index and split into `docs/design/<concern>.md`.

## Process

1. Read `docs/product/vision.md` (Principles filter every UI decision), `docs/srs.md` (the requirements this UI must serve), and existing UI code or design docs.
2. List the surfaces the product needs and the navigation model that connects them. Challenge every extra tab, stack, or modal — a surface exists only when a requirement needs it.
3. Define the rule that picks a surface per interaction (e.g. simple → sheet, continuous or complex → full screen). Make it a rule the implementation can apply without asking.
4. Present the structure using the template below. Reference `RF-XXX` IDs; do not restate requirements.
5. Get approval. Revise if needed.
6. Save to `docs/design/ui-architecture.md`.

## Template

```markdown
# [Product Name] — UI Architecture

> Requirements: [docs/srs.md](../srs.md) — [RF-XXX, ...]
> Decisions: [docs/adr/](../adr/)

## Principles
Non-negotiable UI constraints that filter every screen and flow decision.
1. **[Principle]** — what it rules out

## Global Navigation
The primary navigation model, its items, and their responsibilities. When it changes (contextual tabs, conditional items) and the hard limits (e.g. max 5 tabs).

| Item | Responsibility |
|---|---|

## Surfaces
The recurring surface types and the rule that decides which one an interaction uses.

| Surface | When it is used |
|---|---|

## Key Screens
For each structural screen: what it prioritizes and the interactions it exposes. Not visual layout — structure and intent.

## Extension Model
If the product has plugins/modules: what the host controls (shell, navigation, permissions) vs what the module provides (content, surfaces). What a module may and may not do to navigation.
```

## Done When

Structure approved and saved. Costly-to-reverse navigation decisions (global nav model, tab strategy) → use **adr**. For per-feature interaction detail, use this skill's **flow** scope.
