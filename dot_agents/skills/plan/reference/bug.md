# Bug Delivery Item

Type: `fix`. Route execution through `debugging`.

The root cause is discovered empirically at runtime, so the plan is thin:
capture the symptom and reproduction, then leave Root Cause and Fix for
execution evidence. Name the broken behavior, not a presumed solution.

```markdown
## Problem
[symptom observed: what the user or system saw, not a hypothesis]

## Reproduction
[exact steps or command that triggers the bug]

## Expected
[what should happen]

## Actual
[what happens instead]

## Root Cause
[unknown until supported; the fix agent returns evidence for the parent to record on this issue]

## Fix
[parent records the verified fix and links its PR/MR; do not close on local test success alone]

## Implementation Surface
- `[path/module]`: [suspected area, if known, used for parallel-safety]

## Acceptance
- [ ] reproduction steps now produce expected behavior
- [ ] existing tests pass
- [ ] no regression in related paths

## Verification
[command that must fail before the fix and pass after]
```
