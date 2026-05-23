Investigate and fix a technical problem using root cause analysis.

**Hard rule: no fix without understanding the root cause first. Patches that hide symptoms create debt.**

## Phase 1 — Investigation

- Read error messages completely before doing anything else
- Reproduce the issue consistently — if you can't reproduce it, you don't understand it
- Review recent changes that could have caused this
- Trace data flow backward from the failure to find the origin
- Gather evidence across component boundaries before forming theories

## Phase 2 — Pattern Analysis

- Find working examples in the codebase that do something similar
- Compare broken vs. working implementations side by side
- Identify the specific difference — one precise delta, not a vague area

## Phase 3 — Hypothesis and Test

- State a specific, falsifiable theory ("the issue is X because Y")
- Test with the minimum change that validates or disproves it
- Change one variable at a time — never test multiple hypotheses simultaneously

## Phase 4 — Fix

- Write a failing test that reproduces the issue before touching production code
- Implement a single fix targeting the root cause
- Verify with evidence that the fix works

## Hard Stop

**If 3 different fixes have failed: stop patching. Question the architecture. The problem may be structural — discuss before continuing.**
