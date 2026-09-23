# Feedback Loops

A bounded feedback loop distinguishes hypotheses and verifies the fix. The reporter's observation is evidence even when it cannot be replayed locally; build a new loop when practical.

## Ways to build one

Roughly in order, cheapest first:

1. A failing test at whatever seam reaches the bug: unit, integration, or end to end.
2. A request script against a running dev server, asserting the response.
3. A CLI invocation with a fixture input, diffed against a known-good output.
4. A headless browser script driving the UI and asserting on DOM, console, or network.
5. A replayed capture: save one real request, payload, or event log and push it back through the code path in isolation.
6. A throwaway harness that boots the minimal subset of the system reaching the bug, dependencies stubbed.
7. A property or fuzz loop when the symptom is "sometimes wrong": run a thousand inputs and look for the mode.
8. A bisection harness when the bug appeared between two known states, automated so `git bisect run` can drive it.
9. A differential loop running one input through old and new versions, or two configurations, and diffing.
10. A scripted human loop, last resort, when only a person can click: prompt them step by step and capture what they report.

## Tighten it

- Faster: cache setup, skip unrelated initialisation, narrow the scope.
- Sharper: assert the reported symptom, not "did not crash".
- More deterministic: pin time, seed the generator, isolate the filesystem, freeze the network.

A two-second deterministic loop is a superpower; a thirty-second flaky one is barely better than none.

## When the bug is not deterministic

Increase the reproduction rate when possible by repeating the trigger, narrowing timing, or using controlled stress. Even a rare failure can be investigated with traces or other evidence; report confidence and the conditions actually observed.

## When no loop can be built

State what was tried and what the existing report or captured artifacts establish. If no discriminating check is available, request the specific access, artifact, or temporary instrumentation needed rather than claiming an unverified cause.

## Performance regressions

Measurement replaces the loop: establish a comparable baseline first — timing harness, profiler, query plan — then bisect. Measure first, fix second.
