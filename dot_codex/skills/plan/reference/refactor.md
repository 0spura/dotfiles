# Refactor Delivery Item

Type: `refactor`. Behavior is frozen unless the linked contract explicitly
changes it.

A refactor is a known change (the target structure is decided by reading the
code) with a frozen-behavior gate. Establish the existing proof as a baseline,
restructure, and confirm it still holds. Split only when a child has an
independent acceptance condition or dependency.

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
