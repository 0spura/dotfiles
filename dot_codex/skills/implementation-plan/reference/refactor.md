# Refactor Item

Type prefix: `refactor(<scope>):`, executed by the **worker** agent (behavior frozen).

A refactor is a known change (the target structure is decided by reading the code) with a frozen-behavior gate. `worker` runs the existing tests as the baseline, restructures, and confirms the baseline is still green. For a large multi-module refactor, split it into several refactor child items so each is separately committable and parallel-safe.

```markdown
## Motivation
[why this restructure is needed: coupling, readability, cohesion, testability]

## Scope
[modules, files, or boundaries in scope, and what is explicitly out of scope]

## Behavior Invariants
[what must remain identical: public API, error codes, side effects, data contracts]

## Implementation Surface
- `[path/module]`: [what is restructured, used for parallel-safety]

## Acceptance
- [ ] verification matches the baseline before and after
- [ ] public API and error behavior unchanged
- [ ] no accidental behavior change in edge cases

## Verification
[command that proves behavior is unchanged: test suite, type check]
```
