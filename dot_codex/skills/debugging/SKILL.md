---
name: debugging
description: Diagnose a bug, test failure, or performance regression before changing code. Use for investigation; use code-craft after the cause and proof seam are known.
---

# Debugging

Read the linked tracker item, relevant memory, changed flow, and recent changes.
Build the smallest reproducible feedback loop for the reported symptom before
proposing a fix. Redact secrets and personal data from captured evidence.

1. Reproduce the user's actual symptom through a test, command, request, trace,
   or bounded harness. Make it deterministic and fast where practical.
2. Trace the input, state, and control flow to the shared source of failure;
   compare a working analogue when one exists.
3. State falsifiable hypotheses and test one variable at a time. Add targeted
   instrumentation only when it distinguishes hypotheses, then remove it.
4. Turn the minimized reproduction into a regression proof at the correct
   public seam when one exists. If no such seam exists, report that design gap.

Do not patch a symptom, stack speculative fixes, or claim a cause without
evidence. For a performance regression, establish a comparable baseline and
measure the changed operation before choosing a fix.

Record the reproduction, cause, verification, and blocker with `record_work`
using phase `implementation`; then hand the bounded fix to `code-craft`.
