---
name: code-standards
description: Review changed code for concrete correctness, data-access, security, and maintainability risks. Use for an explicit quality pass or review; implementation skills own normal execution.
---

# Code Standards

For tracker-backed reviews, read the linked contract; otherwise use the user's
request, the diff, and only the local context needed. Apply the `AGENTS.md`
invariants and report only findings with a concrete failure mode or measurable
cost. Repository conventions and configured tooling win.

Keep contract and engineering findings separate: a change can faithfully meet
its requested behavior while still be risky, or be well-crafted while solving
the wrong problem. Check the changed surface for:

- a contract mismatch, untested public behavior, or a test whose expected value
  repeats production logic;
- N+1 queries, remote or filesystem I/O inside an unbounded loop, missing
  pagination, or missing batch/preload/aggregate behavior;
- an API, dependency, type, or configuration value not established by local
  code or current documentation;
- missing validation, authorization, idempotency, atomicity, or failure
  semantics where the contract requires them;
- compressed expressions or control flow that hide state transitions,
  invariants, failure paths, or responsibility boundaries from a maintainer;
- new unreachable code, duplicate logic, needless abstraction, or complexity
  that hides branches with the same outcome.

For a simplification finding, name the safe replacement: `delete`, `reuse`,
`stdlib`, `native`, or `shrink`. Do not flag required validation, failure
handling, accessibility, or independent proof as bloat.

Use query counts, traces, static analysis, or focused tests when available.
Do not invent global metrics or flag style preferences. Return findings under
`Contract` and `Engineering`, each as location, failure mode, evidence, and
smallest correction; report clean areas only when that conclusion is supported
by the inspected scope. Return the review outcome and blocking findings to the
caller.
