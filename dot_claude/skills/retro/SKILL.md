---
name: retro
description: "Turn a recurring failure or repeated correction into a durable fix: mine the pattern, propose one bounded edit to a rule, skill, or agent, and apply it only after approval."
allowed-tools: Read, Grep, Glob, Edit, Write
---

# Retro

Promote a recurring failure into a durable improvement of the system itself. The instance is already handled; retro asks whether the same failure recurs and what small change to a rule, skill, or agent stops it. Mine the weakness, propose a bounded edit, validate, and record what was rejected.

Reserve it for patterns that recurred; a one-off with no shared cause is not a signal.

## Signals to mine

Read durable records, not this conversation's memory:

- Agent project memories (`.claude/agent-memory/<agent>/MEMORY.md`): lessons the executors flagged as recurring.
- Tracker dead ends: failed approaches the implementation loop recorded on items.
- Repeated user corrections: the same feedback given more than once.
- Repeated review findings: a class of finding that keeps returning across PRs.

## Process

1. Cluster the signals by root cause, not surface similarity, since two failures that look alike with different causes are different patterns.
2. Pick one pattern that is recurrent, addressable, and resolvable by a narrow change. Leave one-offs and anything needing a redesign.
3. Locate the smallest surface for the fix:
   - A cross-cutting engineering or security default → the code-standards skill or a rule.
   - A phase's method or gate → the owning skill.
   - An executor's craft → the owning agent, or its project memory when the lesson is repo-specific.
4. Draft one bounded edit. State what it changes, what passing behavior it must preserve, and any prior attempt at the same pattern so a rejected one is not re-proposed.
5. Present the proposal with the clustered evidence and the exact diff. Approval comes before the edit.
6. On approval, apply it. On rejection, record the pattern and the reason so a later retro skips it.

## Constraints

- One pattern per run.
- An edit that fixes one failure while loosening an unrelated rule is not accepted.
- Retro proposes; the user decides what ships.
- Edit existing guidance before adding new, since an overlapping new rule creates drift.

## Done When

The chosen pattern is fixed by an approved edit or recorded as rejected with a reason. Either way the recurring signal has an outcome, not a repeat.
