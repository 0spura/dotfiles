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

[data, compatibility, security, performance, or operational risk; mitigation or rollback when material]

## Compatibility

[breaking change, migration, or consumer action]

## Open decisions

- [decision or follow-up that blocks merge or needs reviewer input]

## Tracker

[issue or tracker link]
```

The title describes the outcome, not the implementation sequence. Keep the
summary reviewable from the diff. Never report a command, approval, or risk
assessment that was not actually established.
