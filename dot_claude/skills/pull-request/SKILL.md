---
name: pull-request
description: "Use after implementation is committed on a branch: open or update a PR, write the PR body, link work items, monitor checks, and handle CI feedback. Works for a feature or a standalone fix/perf/refactor."
---

# Pull Request

Use after a branch has committed work: a feature, or a standalone fix, perf, or refactor. The goal is to create a reviewable PR and keep it healthy until checks are understood.

## Before Opening

1. Confirm branch, base branch, and clean `git status`.
2. Review the full branch diff, not only the latest commit.
3. Run the full verification suite: formatter check, linter, static analysis, test suite, and the project's build command (from `docs/project.md` or the project's tooling). All must pass. Use the Verification command from the work item as the baseline; do not open the PR with known failures.
4. Review loop on the branch diff until it converges. The reviewer and the fixer are separate agents so the review judgment (opus) stays independent of the fix:
   - Delegate the review to the **code-review agent**. If it returns no critical or warning findings, the loop is done.
   - Hand its critical and warning findings to the **apply-review agent** (sonnet), which fixes them, re-runs the verification suite, and commits as fixups. A fix that breaks a test is caught in the same delegation.
   - Re-delegate to the code-review agent. The pass targets whether the applied fixes introduced regressions, not a fresh nitpick hunt.
   - Stop when the code-review agent returns no critical or warning findings. Suggestions do not block the PR and are not re-litigated across passes.
   - If apply-review returns a finding it could not fix (structural decision, out of scope, or a reviewer misread), resolve it with the user or note it in the PR body under **Notes** and move on. Do not loop on it.
5. Confirm the tracker work items this PR delivers are updated.
6. Identify which work items this PR should close or reference: the parent and child items for a feature, or the single item for a standalone fix, perf, or refactor.

## PR Body

```markdown
## Summary

- [concrete change]
- [concrete change]

## Test Plan

- [command actually run]
- [command actually run]

## Risk

[Low, or concrete risk: migration, data, auth, compatibility, performance]

## Breaking Changes

[None, or: what breaks, who is affected, and the migration or rollback path]

## Notes

[rollout, migration, follow-up, or "none"]
```

Rules:

- Title: conventional commit format `<type>(<scope>): <description>` (see git-workflow). Good: `feat(auth): rotate refresh token and detect replay`.
- Summary describes user-visible or system-visible changes, not process.
- Do not include issue numbers in the title or PR body unless explicitly requested.
- Test Plan lists only commands actually run.
- Link the PR to the work item it delivers (the parent, for a feature) through the tracker MCP's native linking (provider-agnostic) and verify it appears there.
- Move that work item or card to review using the tracker native Status field.
- Do not repeat SRS, architecture, ADR, parent item, or child item lists in the PR body unless a reviewer needs the context.
- Mention migrations, breaking changes, auth or security impact, rollout, and follow-ups explicitly.

## Watch Loop

Decide whether to watch before looping. Watch only when the PR has something that changes on its own: CI checks that are running, or requested reviewers who may respond. If it has neither, report the PR state and stop; there is nothing to poll.

When watching, drive the loop yourself rather than on a fixed interval. React to events and pace each poll to how long the checks actually take: a suite that runs for eight minutes is not worth polling every minute. Widen the interval as the PR settles, and stop as soon as the exit condition holds.

Each pass:

1. Fetch the current checks and review threads through the tracker. The check result carries each check's status and, for failed checks, the tail of its failing job log inline, so both progress and diagnosis come from the tracker without shelling out to the host CLI.
2. If a check failed, read the inline log and summarize the real failure. Fix it when it is in scope, delegating a real code defect to the **debug** agent and a scoped change to **implement-item**, then commit with the same conventions and push. Let the next pass confirm the fix.
3. If a failure is out of scope to fix here, stop the loop and report the blocker.
4. If a reviewer left actionable comments, address them and commit. Reply only when approved.
5. Re-run failed jobs only when the failure is flaky or the fix is already pushed.
6. Re-enter the loop until the exit condition holds.

Exit when checks pass and no review thread is left unaddressed, or when a blocker needs the user. Update the PR body or a comment only when useful and approved.

## Done When

The PR is open or updated, has a clear body, links the right work items, and the tracker item is in review. Checks are passing with no unaddressed review threads, or the loop stopped on a blocker that is summarized with next steps.
