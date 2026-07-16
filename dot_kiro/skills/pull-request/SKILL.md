---
name: pull-request
description: Use after implementation is committed on a branch to open or update a PR, write the PR body, link work items, monitor checks, and handle CI feedback.
---

# Pull Request

Use after a branch has committed work: a feature, or a standalone fix, perf, or refactor. Open a reviewable PR and keep it healthy until its checks resolve.

## Before opening

1. Confirm branch, base branch, and clean `git status`.
2. Review the full branch diff, not just the latest commit.
3. Run the full verification suite (formatter, linter, static analysis, tests, and the build command from `docs/project.md`), using the work item's Verification command as the baseline. Open only on green.
4. Run the review loop until it converges:
   - Delegate to the **code-reviewer agent**. On a sensitive diff also delegate to the **security-review agent**. When the item carries a spec also delegate to the **spec-review agent**.
   - Hand the critical and warning findings to the **apply-review agent**, which fixes them, re-runs verification, and commits fixups.
   - Re-delegate to the reviewer, targeting regressions from the fixes. The loop ends when no critical or warning findings remain.
   - A finding apply-review cannot fix goes to the user or into the PR body Notes.
5. Confirm tracker items are updated and identify which the PR closes or references.

## PR body

```markdown
## Summary
- [concrete change]

## Test Plan
- [command actually run]

## Risk
[Low, or concrete risk: migration, data, auth, compatibility, performance]

## Breaking Changes
[None, or: what breaks, who is affected, migration or rollback path]

## Notes
[rollout, migration, follow-up, or "none"]
```

- Title in conventional commit format `<type>(<scope>): <description>`, free of issue numbers unless explicitly requested.
- Summary states user- or system-visible changes, not process.
- Call out migrations, breaking changes, auth or security impact, rollout, and follow-ups.

## Done When

The PR is open, carries a clear body, links the right items, checks pass, and no open review threads, or stopped on a blocker summarized with next steps.
