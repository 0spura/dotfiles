Run a structured code review on local changes or a GitHub PR.

## Usage

- `/code-review` — reviews staged and unstaged local changes
- `/code-review 123` — reviews GitHub PR #123 via `gh pr diff 123`

## Workflow

**1. Get the diff**

For local changes:
```bash
git diff --staged
git diff HEAD
```

For a PR:
```bash
gh pr diff [number]
gh pr view [number] --comments  # check previous review context
```

**2. Eligibility check**

Skip if the diff is purely formatting, whitespace, auto-generated files, or <5 meaningful lines of logic. Report "No review needed — trivial diff."

**3. Run the code-reviewer agent**

Dispatch the `code-reviewer` agent with:
- The full diff
- Output of `git log --oneline -5` for each modified file
- The project's CLAUDE.md and any applicable `rules/` files

**4. Report findings**

Output findings grouped by severity with file:line references and confidence scores. End with a clear verdict: Approve / Warning / Block.

**5. PR comment (optional)**

If reviewing a PR and findings are HIGH or CRITICAL, offer to post a comment:
```bash
gh pr comment [number] --body "[findings]"
```
Ask before posting — never post automatically.
