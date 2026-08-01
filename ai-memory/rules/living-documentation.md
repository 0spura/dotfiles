# Living Documentation

Docs reflect the current state of the system, not the original design. When a code change diverges from what is documented, update the doc in the same commit, not after and not in a follow-up. A commit that changes behavior without updating the relevant doc is incomplete.

- If a task changes the data model, security model, or integration pattern: update `docs/architecture.md`.
- If a task invalidates or changes a requirement: update `docs/srs.md`.
- If a decision that affects system boundaries or public APIs changes: create a new ADR in memory under `decisions/` (pinned), superseding the old one.
