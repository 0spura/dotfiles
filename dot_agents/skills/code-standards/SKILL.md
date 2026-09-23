---
name: code-standards
description: Review changed code for concrete correctness, data-access, security, and maintainability risks. Use for an explicit quality pass or review; implementation skills own normal execution.
---

# Code Standards

Repository conventions and configured tooling win over these defaults. Report only findings with a concrete failure mode or measurable cost, and keep contract findings separate from engineering findings: a change can meet its requested behavior and still be risky, or be well-crafted and solve the wrong problem. Report the two groups side by side: never merge or rerank them into one list, and never name a single worst finding across both.

Read `skill://code-standards/reference/smells.md` when the repository documents nothing, or when a finding needs a name.

Check the changed surface for:

- a contract mismatch, changed public behavior without independent verification, or a test that cannot disagree with the code (tautological, assertion-free, asserting a mock), mixes unrelated failure reasons, or breaks on a behavior-preserving refactor;
- N+1 queries, remote or filesystem I/O inside an unbounded loop, missing pagination, or missing batch/preload/aggregate behavior;
- an API, dependency, type, or configuration value not established by local code or current documentation;
- missing validation, authorization, idempotency, atomicity, or failure semantics the contract requires; a permanent failure reported as retryable, a transient outage as the client's fault, or a failure ignored where the operation requires propagation or accounting;
- compressed expressions or control flow that hide state transitions, invariants, failure paths, or responsibility boundaries;
- nesting deeper than the change requires, a unit changing for unrelated reasons, or a dependency stronger than the boundary needs — shared position, meaning, algorithm, or execution order where a name would do;
- a file carrying unrelated reasons to change, domain-prefixed files that change together without a clear owner, or a module split by size instead of by reason;
- new unreachable code, duplicate logic, needless abstraction, or branches that end in the same outcome.

Name the safe replacement for a simplification finding: `delete`, `reuse`, `stdlib`, `native`, or `shrink`; an installed dependency is also valid when simpler options do not meet the contract. Required validation, failure handling, accessibility, and independent proof are not bloat. Use query counts, traces, static analysis, or focused tests when available; never invent a global metric — complexity scores included — and never report a style preference.

## Output

Findings under `Contract` and `Engineering`, each as location, failure mode, evidence, and smallest correction. Report a clean area only when the inspected scope supports it.
