# Engineering Defaults

## Living Documentation

Docs reflect the current state of the system, not the original design. When a code change diverges from what is documented, update the doc in the same commit, not after and not in a follow-up. A commit that changes behavior without updating the relevant doc is incomplete.

- If a task changes the data model, security model, or integration pattern: update `docs/architecture.md`.
- If a task invalidates or changes a requirement: update `docs/srs.md` (mark deprecated requirements as `~~strikethrough~~`, never delete).
- If a decision that affects system boundaries or public APIs changes: create a new ADR superseding the old one.
- Past ~500 lines or 6 top-level sections, a single-file doc (architecture, SRS) stops being appended to: convert it into an index and split concerns into `docs/<area>/<concern>.md`.

## Tracker Discipline

When a tracker MCP is configured, route work-item and PR operations through it instead of a host CLI shortcut (e.g. `gh pr create`), so linking, status, and relationships stay native. Treat a tracker write as done only after reading it back, never by assuming the call succeeded, and surface a failed write (missing scope, permission, unavailable field) as a blocker to resolve now, not a footnote after the surrounding task is already reported complete.
