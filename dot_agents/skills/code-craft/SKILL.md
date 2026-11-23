---
name: code-craft
description: Implement one bounded, approved change with focused verification and observable proof. Use for features, bug fixes, refactors, performance work, and review fixups; never for planning-only tasks.
---

# Code Craft

Deliver one bounded change that satisfies its contract, touches nothing unrelated, and proves itself at a caller-visible seam.

## House rules

1. **Seam before edits.** Identify the caller-visible seam and its independent expected result before changing code.
2. **Reuse before writing.** Check in order: existing workspace packages/modules & sibling internal SDKs → standard library & native framework primitives (e.g., native router + middleware/layers) → established ecosystem libraries (e.g., error typing, schema validation) → narrowest new code. Never hand-roll cross-cutting infrastructure (config, secrets, auth/authz, validation, HTTP clients) that an existing internal package or standard library already provides.
3. **Root cause, boundaries & resilience.** Trace callers, data shape, and I/O; fix the shared cause, bound collection I/O, and enforce explicit timeouts and cancellation on every external I/O call (no orphan fire-and-forget tasks). Parse untrusted input once at the trust boundary into valid domain types, validate required config fail-fast at startup, and make retryable writes idempotent with explicit state transitions.
4. **Hierarchical error transparency.** Propagate structured, hierarchical errors internally (preserving the cause chain for debugging) and map them through one canonical boundary into clear, actionable, user-friendly errors that never leak internals or secrets.
5. **Strategic, low-noise tracing.** Instrument key boundaries (entry points, auth/policy decisions, external I/O, state transitions, failures) with structured spans/traces and correlation IDs. Log an error once at the handling boundary — never spam logs inside loops or log-and-rethrow across layers.
6. **Clean module layout.** Place code by reason to change — never stuff unrelated responsibilities into an existing file to create a God file, and keep module entry/index files for declarations and intentional public exports rather than stray internal imports.
7. **Freeze unrelated behavior.** Leave untouched paths, style, and dirty worktree changes alone.
8. **Prove happy + failure.** Exercise the acceptance path and at least one meaningful failure or boundary class. When real provisioning or E2E execution is requested, run it for real — never silently substitute stubs.
9. **Read your own diff.** Inspect the final diff as a maintainer before reporting.

## Proof by change type

| Change type | Minimum observable proof |
| --- | --- |
| `feat` | Acceptance path + one boundary/rejection case; cite SRS ID in test name or leading comment when defending a requirement. |
| `fix` | Reproduction/regression check failing before fix (or directly proving the fixed seam) and passing after. |
| `refactor` | Existing caller-visible behavior unchanged under focused verification; no new behavior sneaked in. |
| `perf` | Comparable before/after measurement hitting the stated target, plus correctness preserved. |
| `review fixup` | Affected finding verified directly; no regression on sibling checks. |

## Workflow

1. **Confirm contract.** Read the assigned scope, acceptance criteria, non-goals, and owned paths. Stop immediately if code or requested behavior contradicts the contract.
2. **Trace the flow.** Inspect callers, invariants, and collection/I/O cardinality before editing.
3. **Implement minimally.** Apply the narrowest maintainable change using established repository idioms and clear names. Install or update dependencies only through official CLI tooling when strictly needed.
4. **Verify narrowly.** Run the narrowest checks covering the changed behavior and its failure risk. Add a static, integration, or smoke check only for a distinct risk.
5. **Audit the diff.** Check for hidden invariants, mixed responsibilities, leftover debug logs, and unrelated edits.

## Checklist

- [ ] Caller-visible behavior matches the contract.
- [ ] Acceptance path and one failure/boundary class verified with observed output.
- [ ] All collection/loop I/O is bounded (batched, paginated, or preloaded).
- [ ] Diff is minimal, idiomatic, and free of unrelated changes or temporary instrumentation.
- [ ] Unresolved module boundaries, public contracts, security choices, or data migrations escalated instead of guessed.

## Never

- Invent an API, flag, config key, version, or requirement — return the missing decision instead.
- Reinvent an existing internal package/SDK (e.g., secrets, config, auth/authz layers) or wrap native framework primitives without a concrete contract need.
- Write ad-hoc error response helpers that bypass the project's canonical hierarchical error boundary, or return opaque/internal-leaking error messages to end users.
- Spam logs in hot loops or log-and-rethrow the same failure at multiple layers; never emit secrets, tokens, or raw PII in traces/logs.
- Repeat inline cross-cutting guards (auth, permissions, header extraction) inside every route handler when they belong in a shared middleware/layer or SDK.
- Add an abstraction, dependency, cache, or config option without a present use and observable acceptance.
- Patch around a pre-existing blocking defect instead of reporting it.
- Run project-wide lint, format, or test suites unless the contract or repository workflow explicitly requires it.
- Write tautological tests (recomputing production logic) or mock-only tests that cannot fail when the seam breaks.
- Include internal skill names, instruction paths, or raw build logs in the final report.

## Output

Result, observed verification evidence, changed artifacts, incidental findings, and commit (only when required).
