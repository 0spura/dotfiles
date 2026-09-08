---
name: code-craft
description: Implement one bounded, approved change with local-context checks and observable proof. Use for features, fixes, refactors, performance work, and review fixups; do not use for planning only.
---

# Code Craft

Follow the default code-work rules in `AGENTS.md`. Read the linked tracker
contract and its referenced context once. Stop for an ambiguous contract,
missing verification, or a decision that crosses a public, security, or data
boundary.

1. Establish the caller-visible seam and its independent expected result.
2. Trace the changed flow, including callers and collection/I-O behavior.
3. After tracing the flow, choose the first adequate option: existing local
   code, standard library, native capability, installed dependency, then the
   minimum new code. Freeze unrelated behavior.
4. Exercise the acceptance path and meaningful failure or boundary class.
5. Run the focused test plus the closest static, integration, or smoke check.
6. Inspect the diff for invented APIs, needless dependencies, duplicated logic,
   unbounded I/O, secrets, and unrelated changes.

## Stop conditions

Stop and return the decision needed when the task leaves a module boundary, public contract, security choice, or data migration unresolved. Stop and report a pre-existing blocking defect instead of patching around it.

## Done when

The scoped behavior is implemented, its public outcome is evidenced, collection
work is bounded, focused checks pass, and the diff is reviewable.

Return the result, evidence, user-relevant artifacts changed, incidental findings, and commit. Do not include skill names, internal instruction paths, or raw build logs.

For tracker-backed work, record the same compact outcome in the tracker.

If no public test is possible, state why and run the narrowest applicable check.
Leave unrelated dirty work untouched. Commit only when requested or when the
repository workflow requires it.
