---
name: implementation
description: Execute an approved scoped change (tracked or untracked) by routing work to the right agents, integrating results, and returning verified evidence.
---

# Implementation

Execute an approved contract end-to-end, integrate changes cleanly, and prove the result with observed checks.

Read `skill://plan/reference/workctl.md` **only** for tracked work, and `skill://implementation/reference/parallel-execution.md` before parallelizing any writers.

## House rules

1. **Parent owns integration, layout, and writes.** Before dispatching `worker` or `task` on multi-file or new-concern work, define the exact target file/module layout and the existing internal crates/SDKs/layers it must reuse. The parent manages branch setup, tracker mutations, commits, and PRs; subagents edit only their assigned surface and return evidence.
2. **Never invent tracking.** Use `workctl` only when an issue is supplied or tracking is explicitly required; never create an issue just to implement.
3. **Complete sweeps on repo-wide refactors.** When asked to clean, refactor, or migrate across a repo or multi-repo workspace, enumerate all target paths with `scout` first and verify every target is addressed before reporting done.
4. **Parallelize only disjoint surfaces.** Never run two writers concurrently on overlapping files or shared state.
5. **Verify after integration.** Passing slice checks do not replace verifying the integrated behavior (including meaningful failures). Never substitute stubs when real provisioning or E2E execution was requested.
6. **Respect automation.** Never hand-edit workflow/automation results or self-approve rules to unblock execution.

## Agent routing

| Work type | Agent | Required completion gate |
| --- | --- | --- |
| `feat`, `refactor` | `worker` (`code-craft`) | Focused verification passing; SRS ID cited in durable test when defending a requirement. |
| `fix`, `perf` | `fix` (`debugging` → `code-craft`) | Evidence-backed root cause + regression proof, or comparable perf measurement hitting target. |
| Codebase mapping | `scout` | Concrete map with file paths, lines, and ownership. |
| Frontend / UI build | `worker` + `frontend-craft` | Build/typecheck + states, a11y, and viewport check passing. |
| Post-implementation cleanup | `simplifier` (`code-smells`) | Recent diff simplified directly with focused verification passing and zero behavior change. |
| Pre-merge / pre-commit review | `reviewer` (+ `security-reviewer` for sensitive surfaces) | Concrete bug/smell findings (or clean verdict). |

## Workflow

1. **Prepare context.**
   - *Tracked:* read the canonical issue and reuse or create its linked branch via `workctl`.
   - *Untracked:* inspect the current branch, leave unrelated dirty work alone, and do not switch branches unless required.
2. **Dispatch bounded slices.** Hand each agent its exact scope, acceptance, non-goals, owned paths, and verification (plus issue/branch only when tracked).
3. **Integrate, simplify, and verify.** Exercise the integrated acceptance path and at least one meaningful failure class. For multi-file, cross-crate, or sensitive-surface (auth/authz/secrets/untrusted input) changes, run `simplifier` on the diff (when cleanup is worthwhile) and a quick independent `reviewer` pass (plus `security-reviewer` for sensitive surfaces) before committing — even when committing directly without a PR. Mark SRS requirements `Implemented` only after their named verification passes.
4. **Record and hand off.** Commit only when assigned or required by repo workflow. Record observed evidence on the canonical issue and read back (tracked only). Hand off to `pull-request` only when a PR is requested or required.

## Stop conditions

Stop and escalate on: unresolved structural or security decision, pre-existing blocking defect, missing verification capability, conflicting worktree changes, or unavailable tracker (tracked work only).

## Never

- Close an issue or claim delivery merely because local unit tests pass.
- Parallelize overlapping writers or let subagents switch branches / mutate tracker state.
- Bypass failed checks or approve workflow gates yourself.

## Output

Integrated result, observed verification evidence, changed artifacts, and remaining blockers.
