# Feature Item

Type prefix: `feat(<scope>):`, executed by the **worker** agent (TDD, new behavior).

A feature is decomposed into a parent (the feature boundary) and child items only when a piece has its own PR or commit scope, dependency, risk, or discussion. Otherwise keep it as a checklist in the parent.

## Parent

```markdown
## Goal
[one paragraph: the feature boundary, not a restatement of requirements]

## Requirements
The SRS requirement IDs this feature delivers, each linked. Priority (MoSCoW) and acceptance already live in the SRS; reference them, do not restate or re-prioritize.
- [RF-XXX.N](<link built from tracker context>): [one line: what it delivers]

## Implementation Surface
- `[path/module]`: [responsibility]

## Acceptance
- [ ] [observable result or requirement ID]

## Verification
- [command/check]

## Risk
[data, auth, migration, compatibility, performance, or Low]
```

## Child

```markdown
## Task
[one concrete action]

## Requirement
SRS: `docs/srs.md#rf-xxxn` or none

## Implementation Surface
- `[path/module]`: [expected responsibility]

## Acceptance
- [ ] [observable result]

## Verification
- [command/check]

## Test Strategy
- [unit/integration/e2e/static check and what it proves]

## Notes
[edge cases, migration notes, or "none"]
```
