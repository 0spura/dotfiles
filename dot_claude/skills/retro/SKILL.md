---
name: retro
description: "Use to turn a recurring failure or repeated correction into a durable fix: mine the pattern, propose one bounded edit to a rule, skill, or agent, and apply it only after approval."
allowed-tools: Read, Grep, Glob, Edit, Write
---

# Retro

Use this skill to promote a recurring failure into a durable improvement of the system itself, not to fix one instance. The instance is already handled; retro asks whether the same failure will keep happening and what small change to the rules, skills, or agents would stop it. It follows the self-harness loop: mine the weakness, propose a bounded edit, validate, and keep a record of what was rejected.

Reserve it for patterns that recurred. A one-off is not a signal. Skip it when the failure was a genuine one-time mistake with no shared cause.

## Signals to mine

Look across durable records, not the memory of this conversation:

- Agent project memories (`.claude/agent-memory/<agent>/MEMORY.md`): lessons the executors already flagged as recurring.
- Tracker dead ends: failed approaches the implementation loop recorded on items.
- Repeated user corrections: the same feedback given more than once.
- Repeated review findings: a class of finding that keeps returning across PRs.

## Process

1. Gather the signals above and cluster them by root cause, not surface similarity. Two failures that look alike but have different causes are different patterns.
2. Pick one pattern worth fixing: recurrent, addressable, and resolvable by a narrow change. Ignore one-offs and anything that needs a redesign rather than a rule.
3. Locate where the fix belongs and change the smallest surface:
   - A cross-cutting engineering or security default goes to `rules/`.
   - A phase's method or gate goes to the owning skill.
   - An executor's craft goes to the owning agent, or to its project memory when the lesson is repo-specific rather than universal.
4. Draft one bounded edit, not a rewrite. State what it changes, what it must preserve (the passing behavior it must not break), and any prior attempt at the same pattern so you do not re-propose a rejected one.
5. Present the proposal for approval with the evidence (the clustered signals) and the exact diff. Do not apply before approval.
6. On approval, apply the edit. On rejection, record the pattern and why it was rejected (a tracker note or a short entry) so a later retro does not raise it again.

## Constraints

- One pattern per run. Do not batch unrelated fixes into a sweeping rewrite.
- Preserve what works. An edit that fixes one failure but loosens an unrelated rule is not accepted.
- The human gate is mandatory. Retro proposes; the user decides what ships.
- Prefer editing existing guidance over adding new. A new rule that overlaps an old one creates drift.

## Done When

The chosen pattern is either fixed by an approved bounded edit or recorded as rejected with a reason. Either way the recurring signal has an outcome, not a repeat.
