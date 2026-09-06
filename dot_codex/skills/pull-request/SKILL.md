---
name: pull-request
description: Prepare a verified, reviewable pull request. Use after implementation when a branch is ready for review; do not use to design or implement the change.
---

# Pull Request

## Verify and open

1. Read the active issue and implementation contract; confirm branch, base,
   status, and complete diff. Move the item to the configured review stage when
   the PR is ready; do not create a review child by default.
2. Run the item's verification and applicable repository checks; report skipped
   evidence.
3. Request an independent code review; add security review only for sensitive
   surfaces. Give reviewers the changed paths, acceptance criteria, and base
   reference, not copied session history.
4. Apply bounded findings once, re-run affected checks, and escalate a
   structural contradiction rather than looping indefinitely.

Create or update the PR through the repository's normal system. Preserve a
repository template when one exists; otherwise use
[reference/body.md](reference/body.md). Include only sections that carry
reviewer-relevant information.

## Completion

Record the PR, verification evidence, unresolved findings, failed checks, and
next step with `record_work` using phase `review`. Report missing permissions
and required user decisions.
