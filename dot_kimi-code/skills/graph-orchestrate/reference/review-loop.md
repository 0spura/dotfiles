# PR Review Loop Graph

The concrete graph for reviewing a PR before opening it. Used by the **pull-request** skill.

## Graph Shape

```
                    ┌→ [code-reviewer agent]
[Prepare Diff] ────┼→ [security-review agent]  (if sensitive)
                    └→ [spec-review agent]      (if spec exists)
                              │
                    [Fan-In: merge findings]
                              │
                    [apply-review agent: fix critical + warning]
                              │
                    [Re-review: code-reviewer targets regressions]
                              │
                    findings? ─── yes → [apply-review] → [Re-review] (max 3 total)
                         │
                         no
                         │
                    [Done: PR ready]
```

## Stage Details

### Stage 1: Fan-Out Reviews

Delegate in parallel:

1. **code-reviewer agent** — always. Receives: branch diff, project conventions.
2. **security-review agent** — when the diff touches auth, authorization, user data, payments, secrets, uploads, file access, external URLs, or input handling. Receives: branch diff, security-relevant context.
3. **spec-review agent** — when the work item carries a spec (SRS requirements or PRD). Receives: branch diff, relevant spec sections.

### Stage 2: Fan-In

The orchestrator collects findings from all reviewers and:
- Deduplicates (same issue found by multiple reviewers)
- Classifies: critical (must fix), warning (should fix), suggestion (optional)
- Groups by file and concern

### Stage 3: Apply Fixes

Delegate to **apply-review agent** with the merged critical + warning findings. The agent:
- Fixes each finding
- Re-runs the verification command
- Commits fixups
- Returns what it fixed and what it could not

Findings the agent cannot fix (structural decisions, out of scope, reviewer misread) return to the orchestrator for escalation.

### Stage 4: Re-Review

Delegate to **code-reviewer agent** targeting only:
- Regressions introduced by the fixes
- Whether critical findings are resolved

Not: fresh nitpicks or new suggestions on unchanged code.

### Loop Bound

Maximum 3 review-fix iterations. After 3 rounds:
- If critical findings remain, escalate to the user with the unresolved items.
- Persistent suggestions that the fixer disagrees with go into the PR body **Notes** section.

## Exit Conditions

- Zero critical findings after re-review → PR ready
- 3 iterations exhausted with remaining criticals → stop, report to user
- Unfixable finding (structural, needs user decision) → note in PR body, continue with remaining findings
