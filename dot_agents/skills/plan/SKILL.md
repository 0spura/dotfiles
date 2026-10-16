---
name: plan
description: Turn non-trivial work into one canonical workctl issue that states outcome, boundaries, blockers, and verification, then plan independently verifiable delivery from it.
---

# Plan

The issue is the contract. Discovery, design, requirements, implementation, and review all advance that one item; do not open a ticket per skill or phase. A bounded, reversible one-file task needs no issue unless scope or a durable decision grows.

All tracker work goes through workctl. Read `skill://plan/reference/workctl.md` first: it explains how workctl resolves its context from the repository you are in, how to write safely, and how to read its errors. The rest of this skill assumes it.

## Find or create the contract

1. Work from inside the project being changed. workctl discovers the repository itself, so run `workctl issue list` and `workctl issue view N` plainly.
2. List summaries, then view the matching issue in full and read its linked artifacts once. Reuse a matching item. If none exists, the parent creates one from the template for its type (`feat`, `fix`, `refactor`, `perf` under `skill://plan/reference/`) and reads it back before anything is built. Create relationships as real links, not prose.
3. Keep the contract self-sufficient: goal, acceptance, non-goals, and verification live in the issue, so any agent or later session can continue from the issue number alone. The parent owns tracker writes and readback; execution agents return evidence and proposed updates.

## Plan from the contract

1. Resolve missing discovery, direction, user-flow design, requirements, architecture, or costly choices through the matching skill. Link approved artifacts on this issue rather than copying them.
2. Inspect real blockers before choosing what to execute. Use the blocker view in `workctl issue --help` to see open blocking chains. Parent/child is hierarchy, never a dependency. An empty chain does not prove readiness. Record unresolved decisions as blockers, not invented implementations.
3. Slice vertically: observable goal, owned surface, acceptance oracle, verification, completion gate. Keep internal steps as a checklist. Create a child only for independent acceptance, ownership, deployment, dependency, or review scope, and link it with the relationship flags the provider's help shows.
4. Order true dependencies and serialize overlapping writers. Each slice must verify on its own. Name landing places by responsibility; investigate unknown placement instead of guessing it.
5. The parent records the agreed plan and artifact links on the issue with a surgical edit or a comment, then reads the issue back. Hand the next unblocked contract to `implementation`.

## Done when

The issue names the outcome, boundaries, actual blockers, verification, and next unblocked work. Saving a plan is not approval to build.

## Stop conditions

An unreadable issue, unavailable tracker, unresolved dependency, or unbounded implementation surface blocks execution. Preserve the contract, report the concrete missing prerequisite, and never create a duplicate issue to get around it.
