---
name: plan
description: Bind non-trivial work to its target repository and canonical workctl issue, resolve missing decisions, and plan independently verifiable delivery.
---

# Plan

The issue is the contract; discovery, design, requirements, implementation, and review advance that same item. Do not create a ticket for each skill or phase. A bounded, reversible one-file task needs no issue unless scope or a durable decision grows.

## Bind the work

1. Identify the local checkout being changed and run workctl from that checkout. It automatically resolves the target repository there; do not pass `--repo-path` for routine commands. Use `--repo-path PATH` only when intentionally operating on a different local checkout. The target supplies configuration, origin, provider grammar, and workflow scope; `--repo` overrides remote resource scope only. Relative file arguments resolve from the selected target worktree. Never infer a provider from the agent's own repository or pass provider-selection flags.
2. Read `workctl issue --help`, then list summaries and view the selected issue in full. Read its linked artifacts once. Reuse a matching item; if none exists, the parent creates one from the matching template and reads it back before implementation. Use the default human-readable output; do not pass `--format text`. Request structured output only when exact structured fields are needed.
3. Carry target checkout, canonical issue identity, goal, acceptance, non-goals, and verification through every handoff. IDs alone are insufficient across projects. The parent owns tracker mutations and readback; execution agents return evidence and proposed updates.

## Plan from the contract

1. Classify as `feat`, `fix`, `refactor`, or `perf` and read the matching template under `skill://plan/reference/`.
2. Resolve missing discovery, direction, user-flow design, requirements, architecture, or costly choices through the matching skill. Link approved artifacts on this issue rather than copying them or creating phase tickets.
3. Inspect actual blockers before selecting execution. GitHub `issue blockers ID` reports open blocking chains; use supported native GitLab relationships when applicable, never substitute parent/child relationships for dependencies. An empty chain does not prove readiness. Record unresolved decisions as blockers, not invented implementations.
4. Slice vertically: observable goal, owned surface, acceptance oracle, verification, and completion gate. Keep internal steps as a checklist. Create children only for independent acceptance, ownership, deployment, dependency, or review scope; make real relationships explicit using the selected provider's help.
5. Order true dependencies and serialize overlapping writers. Each slice must be verifiable independently. Name known landing paths by responsibility; investigate unknown placement rather than guessing it.
6. The parent records the agreed plan and artifact links through the target's native issue edit/update or comment/note operation, then reads the issue back. Pass the next unblocked contract to `implementation`, which owns linked-branch creation and execution.

## Done when

The canonical issue names the outcome, boundaries, actual blockers, verification, and next unblocked work. The handoff retains target context; no approval is inferred from a plan being saved.

## Stop conditions

An unreadable item, invalid target, unavailable tracker, unresolved dependency, or unbounded implementation surface blocks execution. Preserve the contract and report the concrete missing prerequisite; never switch project or create a duplicate to bypass it.
