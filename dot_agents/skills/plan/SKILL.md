---
name: plan
description: Plan work around an outcome, boundaries, blockers, and verification. Use a workctl issue only when tracking is explicitly requested or required; otherwise keep the plan in-session.
---

# Plan

The current request and repository instructions define the contract. When work is tracked, discovery, design, requirements, implementation, and review advance one canonical issue; do not open tickets per phase. Do not create a tracker item solely because work is non-trivial.

Use workctl only for actual tracker operations. When an issue is supplied or tracking is explicitly requested or required, read `skill://plan/reference/workctl.md` first. Otherwise skip workctl and plan from the approved request.

## Find or create the contract

1. Decide whether the task is tracked. Reuse an issue supplied by the user or required by repository policy; otherwise use the current approved request as the contract and do not call workctl.
2. For tracked work, list summaries, read the matching issue and linked artifacts once, and create an item only when tracking was explicitly requested or required. Read every tracker write back before implementation.
3. Keep the contract self-sufficient in either place: goal, acceptance, non-goals, blockers, and verification belong in the issue when tracked, or in the in-session plan otherwise. The parent owns tracker writes; agents return evidence.

## Plan from the contract

1. Resolve missing discovery, direction, user-flow design, requirements, architecture, or costly choices through the matching skill. Link approved artifacts to the issue when tracked; otherwise cite them in the plan.
2. For tracked work, inspect blocking chains using the workctl help. Otherwise inspect blockers in the repository and request, and state unresolved dependencies without invoking workctl.
3. Slice vertically: observable goal, owned surface, acceptance oracle, verification, completion gate. Create tracker children only for independently accepted work when tracking is in use; keep internal steps as a checklist.
4. Order true dependencies and serialize overlapping writers. Each slice must verify on its own. Name landing places by responsibility; investigate unknown placement instead of guessing it.
5. Record the agreed plan on the issue only when tracked, then read it back. Otherwise return the plan in-session. Hand the next unblocked contract to `implementation`.

## Done when

The plan names the outcome, boundaries, actual blockers, verification, and next action. When tracked, the issue contains that contract. Saving a plan is not approval to build.

## Stop conditions

An unreadable issue or unavailable tracker blocks only work that is explicitly tracked. For untracked work, use the approved request; unresolved dependencies or an unbounded implementation surface still block execution.
