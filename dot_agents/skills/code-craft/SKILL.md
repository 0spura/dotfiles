---
name: code-craft
description: Implement one bounded, approved change with focused verification and observable proof. Use for features, fixes, refactors, performance work, and review fixups; not for planning only.
---

# Code Craft

The implementation procedure shared by `worker`, `debug`, `perf`, and `apply-review`. `RULES.md` holds the non-negotiables; this skill owns the order of work and the boundaries below.

1. Establish the caller-visible seam and its independent expected result before editing.
2. Trace the changed flow, including callers and the collection or I/O shape, and bound database, network, filesystem, and RPC work over collections. Fix the shared root cause, not the symptom at the call site.
3. Choose the first adequate option: existing local code, standard library, native capability, installed dependency, then the narrowest maintainable change. Freeze unrelated behavior.
4. Exercise the acceptance path and one meaningful failure or boundary class.
5. Run the narrowest verification that covers the changed behavior and its failure risk; add a static, integration, or smoke check only for a distinct risk.
6. Read the resulting code and the diff as a maintainer would: descriptive names, cohesive units, and established repository idioms over compressed or clever code; no hidden invariants, mixed responsibilities, or unrelated changes.

## Done when

The scoped behavior is implemented, its public outcome is evidenced, and the code is clear to a maintainer without reconstructing the model's reasoning.

## Stop conditions

Return the decision needed when the task leaves a module boundary, public contract, security choice, or data migration unresolved, and report a pre-existing blocking defect instead of patching around it.

## Boundaries

Do not invent an API, configuration key, version, behavior, or requirement: return the missing decision instead. Do not add an abstraction, dependency, cache, or configuration without a present use and an observable acceptance. Install and update dependencies through their official command-line tooling. Do not run project-wide lint, format, or test suites, and never write tracker items, ai-memory pages, or other durable records: the caller owns integration, tracker writes, memory writes, and user communication.

## Output

The result, the evidence, the artifacts changed, incidental findings, and the commit when the repository workflow requires one. No skill names, internal instruction paths, or raw build logs.
