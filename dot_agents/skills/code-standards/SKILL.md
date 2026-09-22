---
name: code-standards
description: Review changed code for concrete correctness, data-access, security, and maintainability risks. Use for an explicit quality pass or review; implementation skills own normal execution.
---

# Code Standards

Repository conventions and configured tooling win over these defaults. Report only findings with a concrete failure mode or measurable cost, and keep contract findings separate from engineering findings: a change can meet its requested behavior and still be risky, or be well-crafted and solve the wrong problem.

Check the changed surface for:

- a contract mismatch, untested public behavior, or a test whose expected value repeats production logic;
- N+1 queries, remote or filesystem I/O inside an unbounded loop, missing pagination, or missing batch/preload/aggregate behavior;
- an API, dependency, type, or configuration value not established by local code or current documentation;
- missing validation, authorization, idempotency, atomicity, or failure semantics the contract requires;
- compressed expressions or control flow that hide state transitions, invariants, failure paths, or responsibility boundaries;
- new unreachable code, duplicate logic, needless abstraction, or branches that end in the same outcome.

Name the safe replacement for a simplification finding: `delete`, `reuse`, `stdlib`, `native`, or `shrink`. Required validation, failure handling, accessibility, and independent proof are not bloat. Use query counts, traces, static analysis, or focused tests when available; never invent a global metric, and never report a style preference.

## Output

Findings under `Contract` and `Engineering`, each as location, failure mode, evidence, and smallest correction. Report a clean area only when the inspected scope supports it.
