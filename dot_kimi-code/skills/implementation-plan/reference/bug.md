# Bug Item

Type prefix: `fix(<scope>):`, executed by the **debug** agent.

The root cause is discovered empirically at runtime, so the plan is thin: capture the symptom and how to reproduce it, and leave Root Cause and Fix blank for the debug agent to fill in during execution. `<scope>` names the broken behavior, not the solution.

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
[leave blank, filled in by the debug agent]

## Fix
[leave blank, filled in by the debug agent]

## Implementation Surface
- `[path/module]`: [suspected area, if known, used for parallel-safety]

## Acceptance
- [ ] reproduction steps now produce expected behavior
- [ ] existing tests pass
- [ ] no regression in related paths

## Verification
[command that must fail before the fix and pass after]
```
