# Tracker Discipline

The tracker MCP is configured. Route work-item and PR operations through it instead of a host CLI shortcut (for example, `gh pr create`).

- Treat a tracker write as done only after reading it back, never by assuming the call succeeded.
- Surface a failed write (missing scope, permission, unavailable field) as a blocker to resolve now, not a footnote after the surrounding task is already reported complete.
