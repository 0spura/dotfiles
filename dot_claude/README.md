# Claude Code Configuration

Skills and rules for structured, tracker-driven software development with Claude Code.

## Core Philosophy

The tracker is the source of truth — not local plan files, not conversation history. Every work item, status update, and decision lives in the issue tracker and survives across sessions and agents.

Skills enforce a strict progression: think before designing, design before planning, plan before building. Each phase produces a durable artifact that the next phase reads as its input. An agent can pick up any item in the tracker and know exactly what to do.

Two disciplines run in parallel through every implementation:

- **SDD (system layer):** SRS, architecture, and ADRs are authoritative. Code diverging from them is wrong; update the spec first, then the code.
- **TDD (task layer):** write the focused test before implementing. A passing test that contradicts the spec means the test is wrong.

---

## Feature Development Pipeline

Skills are sequential. Do not skip phases — each gate prevents a class of problems downstream.

```
/brainstorming → /grill-me → /srs → /architecture-design → /adr
                                                              ↓
                             /pull-request ← /implementation ← /implementation-plan
```

| Skill | When to use | Output |
|---|---|---|
| `/brainstorming` | Starting from a rough idea | Explored options with tradeoffs and an approved direction |
| `/grill-me` | Before committing to any plan or design | Stress-tested assumptions, open questions answered |
| `/srs` | After direction is approved | Versioned requirements spec (`docs/srs.md`) |
| `/architecture-design` | After SRS is approved | Service boundaries, data model, APIs, failure modes |
| `/adr` | After a significant technical decision | Recorded ADR in `docs/adr/` |
| `/implementation-plan` | After architecture is approved | Tracker work items with scope, acceptance, and verification |
| `/implementation` | After work items are approved | Implemented, tested, committed, and tracked item |
| `/pull-request` | After all items for the feature are done | Open PR with summary, test plan, and linked items |

### How it runs

`/implementation-plan` creates a parent issue with the feature spec and child issues for each discrete task. Each child issue carries its own acceptance checklist, a verification command — a machine-checkable gate that must pass before the item is closed — and an **Implementation Surface** listing the files it touches. That surface is load-bearing: the loop uses it to decide what can run in parallel.

`/implementation` is the orchestrating loop: it selects the next unblocked child item, sets up the branch, and delegates the build to the **implement-item agent** — one item per agent run. The agent writes the test, implements, verifies, commits, and returns a compact result, keeping build noise out of the loop so context stays lean across many items and features in sequence. The loop then updates the tracker and moves on.

The agent stops and returns when it needs a structural decision or hits a blocking defect; the loop resolves it — with the user, or by handing the defect to the debug agent — and re-invokes. The refactor and perf agents remain standalone maintenance tools; a refactor that is part of building an item is handled inline by implement-item (behavior frozen, tests green).

### Concurrency

The loop runs items **sequentially by default** — one agent at a time, each starting from the previous item's committed state, so no two agents ever touch the working tree at once. Items may run in parallel only when they are provably independent: no `blocks`/`blocked_by`/`related` link and no overlap in their Implementation Surface. Parallel items run in separate worktrees. When two items share a file, they share state — the loop serializes them.

---

## Maintenance Pipelines

Independent of the feature pipeline. Each can start from an existing tracker issue or create one.

Each pipeline is a thin skill over an execution agent. The **skill** owns tracker state — it resolves or creates the issue and updates it when done. The **agent** does the heavy execution in an isolated context (many file reads, test runs, profiling) and returns a result. This keeps the noise of investigation out of the main conversation.

```
/bug-fix   → debug agent          defect reported → reproduced → root cause confirmed → fixed
/refactor  → implement-item       target decided by reading → restructured → baseline still green
/perf      → perf agent           baseline measured → bottleneck found → optimized → remeasured
```

| Skill → Agent | Core constraint |
|---|---|
| `/bug-fix` → debug | Never touch code before confirming you can reproduce. Root cause first, fix second. |
| `/refactor` → implement-item | Behavior is frozen. If any test assertion must change to pass, stop — that is a behavior change. |
| `/perf` → perf | No baseline, no claim. Write a benchmark before touching any code if one does not exist. |

`/refactor` has no dedicated agent because a refactor is not a distinct execution domain: the target structure is decided by **reading** the code (a known change), and implement-item already applies known changes with a frozen-behavior gate. Debug and perf are separate domains because the change is discovered **empirically at runtime** — by reproducing the defect or profiling the bottleneck — an investigation implement-item does not do.

Each agent also reports incidental findings — sibling bugs, adjacent hotspots — in its return. The skill files those as new tracker issues rather than losing them. Discovered work becomes a tracked item, never a side note.

### Starting from an existing issue

Set the active issue before invoking any maintenance skill. The skill reads the issue body as its spec and skips creation.

```
tracker_set_context { active_issue: 42 }
/bug-fix
```

---

## Agents

Skills own tracker state and orchestration; agents do the heavy execution in an isolated context and return a compact result. This keeps build and investigation noise out of the main conversation, so context stays lean.

| Agent | Invoked by | Does |
|---|---|---|
| `implement-item` | `/implementation` loop | Builds one approved child item — test, implement, verify, commit |
| `debug` | `/bug-fix`, or the implementation loop on a blocking defect | Reproduces, isolates root cause, fixes |
| `refactor` | `/refactor` | Restructures within scope with behavior frozen against a baseline |
| `perf` | `/perf` | Measures a baseline, profiles, optimizes, remeasures |

Each agent returns incidental findings (sibling bugs, adjacent hotspots) rather than acting on them; the invoking skill files those as new tracker issues. Discovered work becomes a tracked item, never a side note.

---

## Tracker Integration

Skills drive all work-item operations through the `mcp-tracker` MCP server. No hardcoded provider names, URL schemes, or field names in skill instructions — everything maps to whatever the tracker exposes.

### Providers

```
CODE_PROVIDER   github | gitlab                          # branches, PRs, CI checks
TASK_PROVIDER   github-projects | gitlab-boards | local  # issues, tracker state
```

`TASK_PROVIDER=local` writes markdown files to `.tasks/` in the repo root. Use it when no external tracker account is available — the issue body, checklist, and comments work identically to remote providers.

### Context

Set once per session. All skills and the implementation loop pick it up automatically.

```
tracker_set_context
  repo             owner/repo         auto-detected from git remote
  active_issue     number | null      issue being worked on
  board_id         string             GitHub Projects V2 board number
  default_base     branch name        base branch for new PRs
  default_reviewers  [usernames]
  default_merge_method  merge|squash|rebase
```

When `active_issue` is set, issue tools (`get_issue`, `update_issue`, `move_issue_status`, `toggle_checklist_item`, `add_issue_comment`) use it without requiring an explicit number.

---

## Issue Body as Spec

The issue body is the goal specification for any agent loop. No separate PROMPT.md files.

- **Goal** — what to build or fix
- **Acceptance** — checklist that defines done; the agent checks items off as it progresses
- **Verification** — command that gates completion; must fail before the work, pass after

The agent reads the issue at the start of each loop iteration, checks the acceptance list for remaining items, runs the verification command at the end, and updates the tracker before finishing.

---

## Key Constraints

- Do not create local plan or task files. The tracker is the state.
- Do not start building before the relevant upstream phase is approved.
- Do not optimize, refactor, or fix bugs not in scope for the current item.
- Do not skip verification — a passing checklist without a passing verification command is not done.
- One branch per feature. One item at a time per branch.
