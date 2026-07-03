---
name: debug
description: "Use when a bug surfaces after implementation: reproduce, isolate the root cause, fix with a regression test, and verify — instead of patching symptoms."
---

# Debug

Use when something already built is misbehaving — a failing test, a production error, or unexpected behavior. Goal: fix the root cause with a test that proves it, not the first symptom that stops the error. This skill sits outside the linear pipeline; enter it whenever a defect appears.

## Constraints

- Reproduce before fixing. A fix for a bug you cannot reproduce is a guess.
- Change one thing at a time. Do not bundle a fix with refactors or unrelated cleanup.
- Fix the cause, not the symptom. Suppressing an error, adding a null guard, or widening a type without understanding why the value is wrong hides the bug.
- If the fix diverges from `docs/srs.md` or `docs/architecture.md`, update the spec in the same change — the defect may be a spec gap.

## Process

1. Reproduce: find the smallest input, state, or command that triggers the bug reliably. If it is intermittent, note the conditions that make it more likely.
2. Capture the failing state: exact error, stack trace, logs, and the values involved. Do not log secrets or sensitive data while investigating.
3. Isolate: form a hypothesis about the root cause and narrow it — bisect the code path, check boundaries and assumptions, confirm which layer owns the defect. Trace data from input to the failing sink.
4. Write a failing test that reproduces the bug at the right layer. This test is the definition of done.
5. Fix the root cause until the test passes. Keep the change minimal and scoped to the defect.
6. Search nearby code for the same pattern — a root-cause bug usually has siblings.
7. Run the focused test plus lint/static checks and the surrounding suite.
8. Review the diff, update any spec or doc the fix changed, and commit with a `fix(<scope>):` conventional commit.

## Done When

The bug is reproduced, covered by a regression test, fixed at the root cause, verified, and committed. If the defect revealed a requirement or architecture gap, the relevant doc is updated. If the fix belongs to a tracked feature, update the work item.
