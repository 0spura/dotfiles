---
name: code-standards
description: Review changed code for concrete bugs, edge-case defects, data/I/O hazards, error/observability leaks, and structural smells. Use for focused diff reviews; use simplifier to directly clean up code.
---

# Code Standards

Find concrete defects and measurable maintenance costs introduced in the diff. Repository conventions and configured tooling always override these defaults.

Use `code-smells` (autoloaded alongside this skill) to name structural, error-handling, test, and coupling anti-patterns — do not duplicate its catalog here.

## House rules

1. **Concrete failure mode or measurable cost only.** If you cannot name how it breaks or what it costs, do not report it.
2. **Diff-anchored & read-only.** Flag only defects introduced or exposed by the patch (check consuming dispatch points outside the diff for new types/events/variants). Never edit code, mutate tracker state, or authorize merges.
3. **High signal, zero ceremony.** Do not burn tokens re-auditing settled product requirements or writing prose summaries of things that are fine; focus on real bugs and actionable fixes.
4. **Name the action.** Every simplification finding must state one safe action (`delete`, `reuse`, `stdlib`, `native`, `shrink`) or recommend handing cleanup to `simplifier`.

## Inspection axes

| Axis | What to flag |
| --- | --- |
| **Correctness & Edge Cases** | Logic bugs, broken invariants, silent drops at consumer dispatch points, unestablished API/type/config values, missing idempotency/atomicity, or tests that cannot disagree with the code (tautological, mock-only, happy-path-only). |
| **Data & I/O** | N+1 queries, I/O inside unbounded loops, missing pagination/batching, outbound calls without explicit timeouts/cancellation, or unsupervised fire-and-forget tasks. |
| **Errors & Observability** | Swallowed errors, retryable vs. permanent misclassification, ad-hoc error response helpers bypassing the canonical error boundary, opaque/leaking user errors, log spam in loops, or log-and-rethrow across layers. |
| **Structure (`code-smells`)** | Concrete smells from `code-smells` that add real defect risk or maintenance cost (reinvented internal packages/SDKs, inline per-route guards, God files, messy module roots, flag soup, dead code, speculative wrappers). |

## What is NOT bloat

Required input validation, explicit failure handling, timeouts, accessibility requirements, and independent tests are never simplification findings.

## Never

- Report style preferences, subjective architecture opinions unrelated to the diff, or pre-existing defects outside touched paths.
- Invent complexity scores or global metrics.
- Claim a clean review implies merge authorization.

## Output

Concrete findings ordered by severity (`P0`–`P2`), each as: `location` — `failure mode` — `evidence` — `smallest correction` (plus simplification action when applicable), followed by a 1–2 sentence verdict.
