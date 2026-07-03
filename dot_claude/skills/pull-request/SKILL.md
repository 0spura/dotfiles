---
name: pull-request
description: "Use after feature implementation is committed: open or update a PR, write the PR body, link work items, monitor checks, and handle CI feedback."
---

# Pull Request

Use after the feature branch has committed implementation work. Goal: create a reviewable PR and keep it healthy until checks are understood.

## Before Opening

1. Confirm branch, base branch, and clean `git status`.
2. Review the full branch diff, not only the latest commit.
3. Run the full verification suite: formatter check, linter, static analysis, test suite, and the project's build command (from `docs/project.md` or the project's tooling). All must pass. Use the Verification command from the work item as the baseline — do not open the PR with known failures.
4. If the change touches auth, payments, user data, secrets, public APIs, or file access, run `/security-review` and resolve actionable findings before opening.
5. Confirm tracker work items for the feature are updated.
6. Identify the parent work item and any child items this PR should close or reference.

## Code Review Loop

Run `/code-review` on the branch diff before opening the PR. For each actionable finding:

1. Apply the fix.
2. Commit the fix (same commit conventions as the feature work).
3. Re-run `/code-review` on the updated diff.
4. Repeat until no actionable findings remain — only informational or accepted-risk items are left.

Do not open the PR until the loop exits clean. If a finding cannot be fixed in this PR (out of scope, needs a follow-up), note it explicitly in the PR body under **Notes**.

## PR Body

```markdown
## Summary

- [concrete change]
- [concrete change]

## Test Plan

- [command actually run]
- [command actually run]

## Risk

[Low, or concrete risk: migration/data/auth/compatibility/performance]

## Breaking Changes

[None, or: what breaks, who is affected, and the migration/rollback path]

## Notes

[rollout, migration, follow-up, or "-"]
```

Rules:

- Title: conventional commit format `<type>(<scope>): <description>` (see git-workflow). Good: `feat(auth): rotate refresh token and detect replay`.
- Summary describes user-visible or system-visible changes, not process.
- Do not include issue numbers in the title or PR body unless explicitly requested.
- Test Plan lists only commands actually run.
- Link the PR to the parent work item through the tracker MCP's native linking (provider-agnostic) and verify it appears there.
- Move the parent work item/card to review using the tracker native Status field.
- Do not repeat SRS, architecture, ADR, parent item, or child item lists in the PR body unless needed for reviewer context.
- Mention migrations, breaking changes, auth/security impact, rollout, and follow-ups explicitly.

## Checks

1. After opening or updating the PR, fetch checks.
2. If a check fails, read the failing job logs and summarize the real failure.
3. Fix failures when they are in scope; otherwise report the blocker.
4. Re-run failed jobs only when the failure is flaky or the fix is already pushed.
5. Update the PR body or comment only when useful and approved.

## Done When

The PR is open or updated, has a clear body, links the right work item(s), the tracker item is in review, and checks are passing or their failures are summarized with next steps.
