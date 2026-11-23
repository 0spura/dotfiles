---
name: documentation-style
description: Write or edit concise, durable technical documentation, READMEs, architecture records, and code comments with consistent terminology and verifiable claims.
---

# Documentation Style

Write documentation that another engineer or agent can actually act on and verify — zero filler, zero duplicated sources of truth.

## House rules

1. **Actionable facts only.** Keep only facts, decisions, constraints, procedures, and evidence that change future work.
2. **Link, never copy.** Point to canonical sources (`docs/srs.md`, `docs/architecture.md`, code, CLI `--help`) instead of duplicating them.
3. **Verify before saving.** Check every path, command, link, and claim against the current repository before writing it down.
4. **Comments explain *why*, never *what*.** A code comment documents a non-obvious constraint, invariant, algorithm, or external quirk — never syntax.
5. **Consistent vocabulary.** Use one term per concept across the repository and preserve stable IDs and anchors.

## Workflow

1. **Define purpose.** Confirm audience, scope, owner, and how a reader verifies the document stays accurate.
2. **Draft tightly.** Lead with the rule, procedure, or constraint. Use tables for comparisons/routing and checklists for gates.
3. **Cut ruthlessly.** Strip filler, hedging, synonym variation, repeated guidance, and aspirational statements that bind no work.
4. **Verify claims.** Confirm every file path, link, and command actually exists and does not contradict code or other docs.

## Checklist

- [ ] Every path, link, command, and requirement/code claim verified against the current tree.
- [ ] No duplicated canonical specs or stale contradictions.
- [ ] Consistent domain terms and preserved stable identifiers.
- [ ] Zero filler, narration of obvious syntax, or unverified claims.

## Never

- Write comments that narrate syntax (`// increment i`, `// return result`).
- Copy session logs or raw command dumps into docs or trackers.
- Leave aspirational fluff ("we aim to provide a seamless experience") that binds no behavior.
- Infer user approval merely because a document was written or saved.

## Output

Canonical document path(s) and how links, paths, and claims were verified.
