---
name: grill-me
description: Pressure-test an approved design or costly-to-reverse technical decision one question at a time before committing to data, API, infrastructure, or security choices.
---

# Grill Me

Expose hidden assumptions, risks, and irreversible tradeoffs **before** they get cemented into schemas, public APIs, infrastructure, or security boundaries.

## House rules

1. **Costly decisions only.** Use for hard-to-reverse or high-blast-radius choices — never for routine requirements or settled implementation details.
2. **One question at a time.** Never dump a multi-question survey; follow each answer to its consequences before asking the next.
3. **Highest-leverage uncertainty first.** Ask only questions whose answer actually changes the options, acceptance criteria, or risk profile.
4. **Lead with a recommendation.** When evidence supports a default, state it clearly (keeping user outcomes separate from implementation preferences).
5. **Never invent missing requirements.** Return any unanswered requirement as an explicit gap.

## Workflow

1. **Read context first.** Inspect the contract, code, architecture docs, and ai-memory before asking anything. Preserve established domain vocabulary and flag overloaded or conflicting terms immediately.
2. **Interrogate one axis at a time.** Start with the single uncertainty that could most invalidate downstream work (e.g., data ownership, backwards compatibility, failure mode, trust boundary, migration reversibility).
3. **Trace consequences.** After each user answer, state what it locks in, what it rules out, and whether another high-leverage uncertainty remains.
4. **Close crisply.** Stop as soon as the choice, assumptions, rejected alternatives, accepted risks, and remaining gaps are explicit. Route accepted costly decisions to `adr` and execution to `plan`.

## Checklist

- [ ] Existing code, docs, and memory checked before questioning.
- [ ] Questions asked one at a time, each tied to a concrete option/risk change.
- [ ] Final summary lists: decision, evidence, rejected alternatives, accepted risks, and open gaps.
- [ ] Approved costly decision routed to `adr`.

## Never

- Ask 5–10 questions in one turn.
- Ask trivia that does not change the design or risk.
- Fill a missing product requirement by guessing.
- Treat a saved note or stage change as user approval.

## Output

Explicit decision record (choice, evidence, rejected alternatives, accepted risks, open gaps) and handoff to `adr` / `plan`.
