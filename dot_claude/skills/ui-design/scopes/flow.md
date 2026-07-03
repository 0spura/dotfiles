# UI Design — Flow Scope

Goal: define one feature's interaction flow — how the user moves from entry point to outcome, including states and branches. Saves to `docs/design/flows/<name>.md`.

One file per flow. If a flow covers several distinct interactions (e.g. quick vs retroactive vs a variant), keep them in the same file only while it stays easy to scan; otherwise split by interaction.

## Process

1. Read the relevant `docs/srs.md` requirements for this feature and `docs/design/ui-architecture.md` (the surfaces and navigation this flow must reuse — do not invent new ones here).
2. Identify the entry points: where the flow starts and which surface each entry opens, per the structure rules.
3. Map the steps from entry to outcome. Cover the branches, the states (loading/empty/error), reversibility (undo), and retroactive or skip paths if they exist.
4. Present the flow using the template below. Use compact ASCII step diagrams where a branch is clearer drawn than described. Reference `RF-XXX` IDs for every rule the flow enforces; do not restate the rule.
5. Get approval. Revise if needed.
6. Save to `docs/design/flows/<name>.md`.

## Template

```markdown
# Flow — [Name]

> Business rules: [docs/srs.md](../../srs.md) — [RF-XXX, ...]

## Entry points
Where the flow starts and which surface each entry opens. Table when there are several.

## Steps
The path from entry to outcome, including branches and variants.
Use ASCII diagrams for branching:

    Action A ──┐
               ├──→ Apply → Trigger effects → [Undo]
    Action B ──┘

## States
Loading, empty, error, and success states the surface must handle.

## Outcome
What is committed, what side effects fire, and what remains reversible (and for how long).

## Edge paths
Retroactive entry, skip, cancellation, or domain-specific exceptions — each traced to its RF-XXX.
```

## Done When

Flow approved and saved. Suggest **srs** if the flow revealed a missing or ambiguous requirement, otherwise **implementation-plan** to sequence the work.
