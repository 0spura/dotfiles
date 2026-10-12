---
name: code-craft
description: Implement one bounded, approved change with focused verification and observable proof. Use for features, fixes, refactors, performance work, and review fixups; not for planning only.
---

# Code Craft

For tracked work, start with the target checkout, canonical workctl issue, linked branch, acceptance, and verification handed off by `implementation`; stop if the code or requested behavior contradicts that contract. The parent establishes branch/tracker context before editing; an execution agent never changes the shared branch or writes the tracker. A bounded reversible one-file task can remain untracked.

1. Establish the caller-visible seam and its independent expected result before editing. When a durable test defends an SRS requirement, cite its ID in the test name or a leading comment so changes to the requirement have a known verification target.
2. Trace the changed flow, including callers and the collection or I/O shape, and bound database, network, filesystem, and RPC work over collections. Fix the shared root cause, not the symptom at the call site.
3. Choose the first adequate option: existing local code, standard library, native capability, installed dependency, then the narrowest maintainable change. Freeze unrelated behavior.
4. Exercise the acceptance path and one meaningful failure or boundary class.
5. Run the narrowest verification that covers the changed behavior and its failure risk; add a static, integration, or smoke check only for a distinct risk.
6. Read the resulting code and the diff as a maintainer would: descriptive names, cohesive units, and established repository idioms over compressed or clever code; no hidden invariants, mixed responsibilities, or unrelated changes.

## Done when

The issue's scoped behavior is implemented and independently evidenced. Return changed artifacts, actual checks and results, and remaining blockers to the parent for issue readback and PR/MR handoff; do not close the issue or claim delivery merely because local code passes.

## Stop conditions

Return the decision needed when the task leaves a module boundary, public contract, security choice, or data migration unresolved, and report a pre-existing blocking defect instead of patching around it.

## Boundaries

Do not invent an API, configuration key, version, behavior, or requirement: return the missing decision instead. Do not add an abstraction, dependency, cache, or configuration without a present use and an observable acceptance. Install and update dependencies through their official command-line tooling. Do not run project-wide lint, format, or test suites.

## Output

The result, the evidence, the artifacts changed, incidental findings, and the commit when the repository workflow requires one. No skill names, internal instruction paths, or raw build logs.
