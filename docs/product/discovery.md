# Product Discovery: Lean, Evidence-Based Agent Workflow

## Purpose

Reduce avoidable defects and code bloat in AI-assisted changes by making the
existing Codex workflow prefer verified local context, minimal correct
implementations, bounded data access, and independent review.

Research date: 2026-09-05.

## Users

The primary user is the developer delegating repository changes to Codex.
Reviewers and future maintainers are downstream users: they need small diffs,
clear evidence, and predictable operational behavior.

## Current Process

The current harness had 13 skills (390 lines). Its useful requirements were
spread across `AGENTS.md`, `code-craft`, and `code-standards`; tracker and
multi-agent procedures are also presented as defaults for ordinary work. This
makes it easy for an agent to satisfy prose while missing a concrete data-flow
or dependency check.

Observed repository concerns:

- The execution rules do not explicitly prohibit per-item database or network
  calls in a collection path.
- Several skills repeat "small change", testing, security, and stop-condition
  guidance with different wording.
- The installed Ponytail hook model adds persistent modes and prompt injection;
  it does not itself check query shape, API existence, or tests.

## Comparative review

- Ponytail's useful contribution is its adequacy ladder: reuse local code,
  standard library, native capability, installed dependency, then minimum new
  code. Its persistent modes, debt comments, and separate simplification-only
  review would duplicate the harness or create a second workflow.
- Matt Pocock's skills add two useful distinctions: questions in a design
  interview must change a decision, and review must separately test contract
  compliance from engineering quality. Its tracker labels, fixed file layouts,
  and mandatory subagents are provider or workflow choices, not universal
  constraints.
- Superpowers reinforces a reproducible feedback loop before a bug fix and
  fresh evidence before a completion claim. Its fixed approval gates and
  detailed per-task ceremony would be disproportionate for bounded work.

The resulting harness adds a focused `debugging` skill, strengthens `grill-me`,
and separates contract from engineering review. It keeps the tracker contract
portable through the MCP's semantic `record_work` tool.

## Evidence

- LLMs can produce plausible but incorrect code, including dead code, logic and
  robustness errors, and security defects. [CodeMirage](https://arxiv.org/abs/2408.08333)
  catalogues these failure classes.
- API hallucination and deprecated API use remain practical failure modes; the
  mitigation is to constrain generation with repository dependencies and
  current documentation, then validate the result. [API hallucination study](https://arxiv.org/abs/2505.05057)
  and [deprecated-API evaluation](https://arxiv.org/pdf/2406.09834).
- Prompting alone did not reliably reduce vulnerability frequency in a
  multi-model, multi-language study; executable review and verification gates
  remain necessary. [Security evaluation](https://arxiv.org/abs/2605.24298)
- ORM lazy loading can emit one query per accessed relationship; SQLAlchemy
  documents this as the N+1 problem and recommends explicit eager-loading
  strategies. [SQLAlchemy relationship loading](https://docs.sqlalchemy.org/en/21/orm/queryguide/relationships.html)
- Current vendor guidance likewise requires humans to understand, review, and
  test AI-generated code, using relevant and current project context rather
  than broad or stale context. [GitHub responsible-use guidance](https://docs.github.com/en/copilot/responsible-use/chat-in-github)
- Independent authoring and review reduce shared-model bias in high-velocity
  agent workflows. [Google SRE guidance](https://sre.google/resources/practices-and-processes/ai-engineering-reliable-operations/)

## Scope

This change rewrites existing global instructions and skills. It makes the
quality bar part of normal implementation and review; it does not install the
Ponytail plugin, add a persistent mode, add a database abstraction, or create
new lifecycle hooks. Matt Pocock and Superpowers were cloned into `/tmp` for
comparison only; their skills are not installed as a second overlapping pack.

## Design Principles

1. Read the changed flow and local contracts before choosing an implementation.
2. Stop at the first adequate option: existing code, standard library, native
   capability, installed dependency, then minimal new code.
3. Treat every collection that can trigger database, network, filesystem, or
   RPC work as a query-shape review: no unbounded per-item I/O; batch, preload,
   aggregate, paginate, or explicitly justify the bounded exception.
4. Verify claims at a public seam with an independent expected value. Use query
   counts, traces, or benchmarks when the repository exposes them.
5. Keep the author and reviewer independent for material changes.

## Constraints

- Existing security rules remain mandatory; small code is not a reason to drop
  validation, authorization, failure handling, accessibility, or tests.
- Repository-specific conventions and tooling override generic guidance.
- A new dependency, abstraction, cache, or asynchronous workflow needs a
  present need and an observable acceptance condition.

## Success Criteria

- One canonical set of implementation invariants in `AGENTS.md`; skills refer
  to it instead of restating it.
- All changed collection paths explicitly account for I/O cardinality.
- Reviews report concrete failure modes or measured costs, not style opinions.
- Focused verification and diff inspection remain required before completion.

## Assumptions

The target repositories expose enough code, tests, logs, or tooling to inspect
the affected execution path. Where query-count tooling is absent, the agent can
still establish query shape from the code and report that limitation.
