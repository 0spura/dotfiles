# Agent Delegation Rules

## When to Use Subagents

Invoke without waiting for user direction:

| Scenario | Agent |
|---|---|
| Complex feature with multiple files or phases | `planner` |
| Architecture or technology decision | `architect` |
| After writing or modifying code | `code-reviewer` |
| Build or compile failure | `build-error-resolver` |
| Auth changes, new API endpoints, secrets, payment | `security-reviewer` |
| Maintenance window, dead code cleanup | `refactor-cleaner` |
| After major features or API changes | `doc-updater` |

## Opt-in Agents

Invoke only when the project or user explicitly calls for it:

| Scenario | Agent |
|---|---|
| Project uses TDD or user requests test-first | `tdd-guide` |

## Parallel Agents — Decision Framework

**Use parallel agents when:**
- 3+ independent failures or tasks exist with no shared state
- Problems span different domains that can be understood independently
- Agents would not interfere with each other's changes

**Do not use parallel agents when:**
- Failures are related or have a common root cause
- Agents need each other's output to proceed
- Full system context is required by all agents

## Subagent-Driven Development

When executing a plan with independent tasks:
- **Fresh agent per task** — each agent gets isolated, focused context, not your full session history
- **Two mandatory review stages per task:** spec compliance first, then code quality — never combined, never skipped
- **Never dispatch multiple implementers simultaneously** — one at a time, review between each
- **Model selection:** cheaper models for mechanical/repetitive tasks; standard for integration; best available for architecture and security

## Sub-agent Context

When dispatching any subagent, pass both:
1. The specific query or task
2. The broader objective and why it matters

Evaluate the return before accepting it. If key details are missing, ask follow-up questions (max 3 cycles before escalating).

## When NOT to Use a Subagent

- Simple, single-file tasks handleable in the main context
- When spawning would duplicate work already in context
- For questions that need an answer, not delegation
