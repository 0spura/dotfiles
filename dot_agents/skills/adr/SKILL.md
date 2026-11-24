---
name: adr
description: Record an explicitly approved, costly-to-reverse architecture decision as a durable ai-memory record (and docs/adr/ file only when the repository requires one).
---

# ADR

Capture durable rationale for costly-to-reverse decisions without cluttering active contracts (`docs/srs.md`, `docs/architecture.md`).

## House rules

1. **Costly-to-reverse + explicitly approved only.** Record only decisions affecting system boundaries, data ownership, public contracts, infrastructure, security, or migrations that have explicit approval.
2. **History, not active contract.** `docs/srs.md` and `docs/architecture.md` remain the active contracts; ADR records explain *why* and link back to them.
3. **Append-only history.** Never overwrite or edit a superseded decision; write a new ADR that explicitly cites the superseded record.
4. **Parent writes durable records.** Subagents propose wording and evidence only; the parent writes to ai-memory and links the issue (when tracked).

## Where to store

| Repository policy | Authoritative record | ai-memory action |
| --- | --- | --- |
| Repo already uses `docs/adr/` as a review/release artifact | `docs/adr/<id>-<slug>.md` | Write compact ai-memory record linking to the file. |
| Default (no repo ADR convention) | Self-contained `mcp__ai_memory_memory_write_page` record | Include full template, source paths, and tracker ID if applicable. |

## Template

```markdown
# Decision title

- Status: Proposed | Accepted | Superseded
- Date: YYYY-MM-DD
- Tracker: [issue ID, omit if untracked]
- Supersedes: [prior ADR path or page, omit if none]

## Context
## Decision
## Consequences
## Alternatives
## Traceability
```

## Checklist

- [ ] Explicit approval confirmed (not inferred from a draft or stage change).
- [ ] Unambiguous status, date, consequences, rejected alternatives, and source traceability included.
- [ ] Any superseded record cited without overwriting it.
- [ ] Accepted constraints handed to `plan` / `implementation`.

## Never

- Record routine implementation details or easily reversible refactors as ADRs.
- Mark a proposal `Accepted` without explicit user approval.
- Open a separate tracker ticket just for writing an ADR.

## Output

Canonical ADR location (ai-memory page and/or `docs/adr/` path), status, and accepted constraints for downstream work.
