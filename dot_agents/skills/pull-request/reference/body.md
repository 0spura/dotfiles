# Pull Request Body

Use this only when the repository does not supply its own pull-request template.
Omit a section when it has no material information; do not fill it with "none".

```markdown
## Summary

- [user-visible or architectural change]
- [second material change, if any]

## Verification

- `[command actually run]` — [observed result]

## Risk and rollout

[data, compatibility, security, performance, or operational risk; staged exposure, observable signals, and rollback or disable path when material]

## Compatibility

[breaking change, migration, or consumer action]

## Open decisions

- [decision or follow-up that blocks merge or needs reviewer input]

## Tracker

[canonical issue identity and link; use supported explicit workctl issue-reference options when publishing]
```

The title describes the outcome, not the implementation sequence. Keep the
summary reviewable from the diff.

The parent records this request on the same issue and reads back both. A request link is not delivery: queued merge, confirmed merge, issue closure, and workflow effects are separate observed states.
