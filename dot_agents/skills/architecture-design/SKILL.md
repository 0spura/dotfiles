---
name: architecture-design
description: Design the smallest deep-module implementation structure for accepted requirements. Use before coding when a change introduces a module boundary, data ownership, integration, or failure-boundary decision.
---

# Architecture Design

Design the smallest structure of deep modules that satisfies accepted requirements and evolves safely.

Read `skill://architecture-design/reference/deep-modules.md` when choosing a seam, `skill://architecture-design/reference/module-layout.md` when placing files, `skill://architecture-design/reference/patterns.md` for pragmatic architecture defaults, and `skill://architecture-design/reference/template.md` when updating `docs/architecture.md`.

## House rules

1. **Deep modules over shallow wrappers.** Prefer substantial behavior behind a narrow, stable interface; delete any layer that only forwards calls.
2. **Place by reason to change, never by file size.** Group code that changes for the same actor/policy; split only when independent policies diverge.
3. **Every seam has a failure path.** Every external/integration boundary must declare timeouts, error semantics, and fallback or fail-closed behavior.
4. **Bound all collection I/O.** State expected cardinality plus the pagination, batching, or query bound for every collection path.
5. **Earn every abstraction.** Add an interface/adapter only to hide real complexity or serve a second concrete variation — never speculatively.
6. **Escalate costly choices.** Route hard-to-reverse data, API, infra, or security decisions through `grill-me` (and `adr` once approved) before locking them in.

## Per-seam specification

For each new or changed seam, specify only:

| Field | What to state |
| --- | --- |
| **Owner** | Module/subsystem responsible for the policy and state. |
| **Contract** | Inputs, outputs, and public interface callers and tests cross. |
| **Invariants** | Rules the module enforces internally (never left to callers). |
| **Failure behavior** | Retryable vs permanent errors, atomicity/idempotency, fail-closed rules. |
| **Trust boundary** | Validation, authz, and untrusted input sanitization points. |
| **I/O bound** | Collection cardinality and pagination/batch/query cap. |
| **Rollout** | Gradual exposure, observable health signal, and rollback path (when risk warrants). |

## Workflow

1. **Anchor to scope & reuse inventory.** Read accepted requirements, workspace manifests, sibling internal SDKs, and current codebase layout first. Identify every existing internal crate, SDK layer, or native framework primitive that should be reused or extended before proposing any new module or crate. Do not invent unrequested scope.
2. **Choose seams and layout.** Identify changed responsibilities, apply the deletion test to proposed layers, and name exact landing paths.
3. **Specify each changed seam.** Complete the table fields above; reference `srs` and `adr` IDs instead of repeating them.
4. **Update docs only when applicable.** Update `docs/architecture.md` (split into `docs/architecture/<concern>.md` with an index if navigation degrades) and `docs/project.md` when the system structure changes.

## Checklist

- [ ] Every changed seam has a single clear owner and public test seam.
- [ ] Every integration specifies failure behavior and trust boundaries.
- [ ] Every collection path has bounded DB/network/filesystem I/O.
- [ ] No speculative abstraction or size-based file splits.
- [ ] Costly irreversible choices flagged for `grill-me` / user approval.

## Never

- Split files by line count instead of reason to change.
- Add a pass-through "middle man" layer that enforces no invariant or boundary.
- Duplicate SRS requirements or ADR rationale inside `docs/architecture.md`.
- Commit silently to irreversible schema, public API, or security choices.

## Output

Architecture artifact (seams, invariants, failure behavior, I/O bounds, placement) and unresolved choices.
