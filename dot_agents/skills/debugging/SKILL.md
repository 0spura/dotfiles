---
name: debugging
description: Diagnose a bug, test failure, or performance regression before changing code. Use for investigation; use code-craft once the cause and proof seam are known.
---

# Debugging

1. Reproduce the reported symptom through a test, command, request, trace, or bounded harness; make it deterministic and fast where practical.
2. Trace input, state, and control flow to the shared source of failure, comparing a working analogue when one exists.
3. State falsifiable hypotheses and change one variable at a time. Add instrumentation only when it distinguishes hypotheses, then remove it.
4. Turn the minimized reproduction into a regression proof at the correct public seam; when no such seam exists, report that design gap.
5. Hand the bounded fix to `code-craft`.

## Stop conditions

Never patch a symptom, stack speculative fixes, or claim a cause without evidence. For a performance regression, establish a comparable baseline and measure the changed operation before choosing a fix.

## Output

The reproduction, the cause, the verification, and any blocker.
