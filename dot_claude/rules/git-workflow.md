# Git Workflow

## Workspace Safety

- Check `git status --short` before substantial edits when working in a repo.
- Never revert, overwrite, or clean up changes you did not make unless explicitly asked.
- If the workspace is dirty and the task is large, ask whether to create an isolated worktree.
- Before creating a worktree, detect whether the current checkout is already isolated. Do not create nested worktrees.
- Use a project-local `.worktrees/` directory only if it is ignored by git; otherwise ask before changing ignore rules.

## During Work

- Keep changes scoped to the requested behavior.
- Avoid mixing formatting-only churn with behavior changes.
- Review `git diff` before finishing significant work.
- Run focused verification that matches the risk of the change.

## Commits

Commit only when the user asks. When the conversation shifts to a new domain or feature — and there are unstaged changes from the previous work — suggest committing before proceeding.

Use one logical change per commit. Before committing:

- Review `git diff --staged`.
- Confirm no debug logs, commented-out code, hardcoded secrets, or unrelated files are staged.
- Use appropriate conventional commits:

```text
<type>: <short description>

[optional body]
```

## Pull Requests

Before opening or updating a PR:

- Review the full branch diff, not only the latest commit.
- Include a concise summary and test plan.
- Mention important risks, migrations, or follow-up work.
- Ask before posting review comments or PR comments on the user's behalf.
