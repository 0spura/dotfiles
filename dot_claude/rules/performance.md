# Performance and Model Selection

## Model Selection for Subagents

| Task | Model |
|---|---|
| Quick search, simple lookup, repetitive/mechanical tasks | `haiku` |
| Standard coding, most development work | `sonnet` (default) |
| Architecture decisions, security review, complex multi-file reasoning | `opus` |

Default to Sonnet. Upgrade to Opus when: first attempt failed, task spans 5+ files, architectural decision, or security-critical code. Use Haiku when task is repetitive and instructions are very clear.

## Context Window Management

- Keep ≤ 10 MCPs active at a time
- Disable unused MCPs per project — each costs tokens even when idle
- Prefer manual `/compact` at logical phase transitions over auto-compact mid-task
- Avoid the last 20% of the context window for complex refactors

## Code-Level Performance

- Optimize only after measuring — no premature optimization
- Minimize network round-trips; batch requests where possible
- Use caching at appropriate layers
- Parallel async execution: `Promise.all()` for independent operations
- Avoid N+1 query patterns — batch or eager-load related data
