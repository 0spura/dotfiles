# Development Pipeline

A skill-and-agent system that carries a change from idea to shipped PR, spec-driven (SDD) and test-driven (TDD) throughout.

## The main flow

```
/product-discovery → /brainstorming → /grill-me → /srs → /architecture-design → /implementation-plan → /implementation → /pull-request
```

| Step | Skill / agent | Produces |
|---|---|---|
| 1 | **product-discovery** (agent) | `docs/product/discovery.md`, market research or internal brief |
| 2 | **brainstorming** | Approved design; `docs/product/vision.md` at product scope |
| 3 | **grill-me** (optional) | Pressure-tested design, only for costly-to-reverse decisions |
| 4 | **srs** | `docs/srs.md`, versioned requirements (the *what*) |
| 5 | **architecture-design** | `docs/architecture.md` + ADRs (the *how*); **ux-design** (agent) runs in parallel for significant UI |
| 6 | **implementation-plan** | Typed tracker work items, sliced as vertical tracer bullets |
| 7 | **implementation** | Backlog drained, each item dispatched and committed |
| 8 | **pull-request** | PR open, reviewed, checks green |

Settle steps 2–6 before writing code. A small, direct request (`/implementation do issue 35`) can skip straight to step 7; the loop shapes a minimal spec on the fly if the issue isn't already a proper item.

## On-ramps

- **project-audit** (agent): arriving at an existing codebase with no docs or stale docs. Derives the minimal doc set and tells you where to enter the main flow.
- **retro**: a failure or correction that keeps recurring. Mines the pattern and proposes one bounded edit to a rule, skill, or agent — applied only after approval.

## Item types and dispatch

`implementation-plan` types every item by its title prefix; `implementation` reads that prefix to pick the executor:

| Prefix | Type | Executor | Gate |
|---|---|---|---|
| `feat(scope):` | Feature | implement-item | new focused test passes |
| `refactor(scope):` | Refactor | implement-item | baseline stays green (behavior frozen) |
| `fix(scope):` | Bug | debug | reproduction fixed + regression test |
| `perf(scope):` | Performance | perf | before/after benchmark meets target |

**Sizing:** a feature big enough to need its own PRs, dependencies, or risk per piece gets a parent item plus child items (the epic pattern, via the tracker's native sub-items/relationships). A small change stays one item with a `- [ ]` checklist. A **wide refactor** (a mechanical change with a huge blast radius, like renaming a shared column) is sliced as expand → migrate → contract instead of a vertical slice.

## The implementation loop

`implementation` never writes code itself — it selects, prepares the branch, dispatches to the right executor agent, and updates the tracker. This is what keeps its own context lean across many items. Concurrency is sequential by default; only items with no tracker relationship and disjoint Implementation Surfaces run in parallel (see `skills/implementation/reference/parallel-execution.md`).

## The review loop

`pull-request` runs review agents in parallel, each judging one axis, until none report a blocking finding:

- **code-reviewer**: bugs, obvious security issues, design problems.
- **security-review**: deep input-to-sink audit, only when the diff touches a sensitive surface (auth, payments, secrets, uploads, URLs, input handling).
- **spec-review**: does the diff faithfully implement the item and its SRS requirements? (missing, extra, or wrong behavior)
- **apply-review**: fixes what the above find, then hands back for re-review.

## Preloaded skills (never invoked directly)

Some skills exist only to be preloaded into an agent's context via its `skills:` frontmatter field, not to be run by you:

- **code-craft**: how to run a code-changing task (scope, spec alignment, verification). Loaded by implement-item, debug, perf, apply-review.
- **code-standards**: the quality bar for code (simplicity, tests, secure-by-construction). Loaded by the same agents plus code-reviewer.
- **design-principles**: empirical HCI/UX guidelines. Loaded by ux-design.

## Model and effort

Each invocable skill sets its own `model`/`effort` in frontmatter, so the right amount of thinking is spent automatically without you choosing it per turn:

- **opus / high**: brainstorming, grill-me, architecture-design, retro — open-ended design and judgment.
- **opus / medium**: srs, implementation-plan, implementation — spec-guided decisions.
- **sonnet / medium**: adr, pull-request — mostly mechanical recording and orchestration.

Agents follow the same idea: implement-item and apply-review run sonnet/medium (execution against an already-settled spec); debug, perf, and the review agents run opus/high (empirical discovery or judgment calls).

## Rules (always loaded)

`CLAUDE.md` and `rules/` carry only what must be true in every context: working approach, output conventions, logging, missing-input handling, a security floor, and git workflow (including the commit message format). Anything specific to writing or reviewing code lives in `code-standards` instead, so it loads only where it's used.
