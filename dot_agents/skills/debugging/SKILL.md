---
name: debugging
description: Diagnose a bug, test failure, or performance regression before changing code. Use for investigation; use code-craft once the cause and proof seam are known.
---

# Debugging

Start from the reported observation. Do not rerun a check merely to confirm what the reporter already established. Read `skill://debugging/reference/feedback-loops.md` when the failure has no bounded reproduction yet.

1. Capture the exact symptom and expected behavior from the report, logs, trace, or failing command. Build the smallest independent reproduction when practical; distinguish a failure in the reported path from a nearby one.
2. Minimize only the inputs and steps needed to isolate the cause. Preserve the symptom while removing incidental setup.
3. Trace input, state, and control flow to the shared failure. Form falsifiable hypotheses from evidence, rank only plausible ones, and use a discriminating check for each; change one variable at a time.
4. Add instrumentation only where it distinguishes hypotheses, tag temporary logs for cleanup, and redact secrets from everything quoted.
5. Identify the caller-visible regression proof and its expected result. Hand the supported cause and proof seam to `code-craft` for implementation, post-fix verification, and cleanup of temporary instrumentation or harnesses; retain a regression test only when it protects a plausible bug.

## Stop conditions

Do not assert a cause without evidence. If local reproduction is unavailable, use the reported failure and available artifacts to narrow the path; say what remains uncertain. Stop before a speculative fix when neither an observed failure nor a discriminating check supports it. For performance work, establish comparable measurements before claiming improvement.

## Output

The reported observation, reproduction or other evidence, supported cause and uncertainty, diagnostic checks, proposed post-fix proof, and any blocker.
