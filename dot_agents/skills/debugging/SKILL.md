---
name: debugging
description: Diagnose a bug, test failure, or performance regression before changing code. Use for root-cause investigation; hand off to code-craft once the cause and proof seam are established.
---

# Debugging

Prove the root cause before touching production logic. Read `skill://debugging/reference/feedback-loops.md` when no fast local reproduction exists yet.

## House rules

1. **Trust the reported observation.** Do not rerun a check merely to re-confirm what the reporter already proved.
2. **Reproduce before theorizing.** Build the smallest deterministic feedback loop that exhibits the exact symptom.
3. **One variable at a time.** Every diagnostic check must discriminate between competing hypotheses.
4. **Evidence over intuition.** Never assert a cause or apply a speculative fix without an observed failure or discriminating check.
5. **Measure first for perf.** Establish a comparable baseline (timing, profiler, query plan) before proposing any optimization.

## Workflow

1. **Pin the symptom.** Capture exact error, expected behavior, logs, trace, or failing command. Distinguish the reported path from nearby failures.
2. **Minimize the repro.** Strip incidental setup while preserving the exact failure.
3. **Form and test hypotheses.** Trace input, state, and control flow to the shared failure. Rank only plausible causes and run one discriminating check per hypothesis.
4. **Instrument safely.** Add temporary logs/probes only where they separate hypotheses; tag them clearly for cleanup and redact secrets from all quoted output.
5. **Define the proof seam.** Identify the caller-visible regression test (or comparable perf measurement) and hand the supported cause + proof seam to `code-craft` for the fix and instrumentation cleanup.

## When local reproduction is impossible

State what was attempted, what existing logs/traces establish, and what remains uncertain. Request the specific missing artifact, access, or temporary instrumentation rather than guessing.

## Checklist

- [ ] Exact symptom and expected behavior captured.
- [ ] Root cause backed by a discriminating check (or explicit uncertainty stated).
- [ ] Caller-visible regression proof seam named with expected pass/fail behavior.
- [ ] Any temporary instrumentation tagged for cleanup and free of secrets.

## Never

- Apply "try this and see" edits before narrowing the cause.
- Keep hypotheses inside acceptance criteria.
- Retain a regression test that guards an impossible or contrived state.
- Claim a performance improvement without before/after measurements on comparable inputs.

## Output

Reported observation, reproduction/evidence, supported cause (and remaining uncertainty), diagnostic checks run, proposed post-fix proof seam, and blockers.
