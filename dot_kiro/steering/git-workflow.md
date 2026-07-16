# Git Workflow

## Workspace safety

- Check `git status --short` before substantial edits, and leave changes you did not make alone unless asked to touch them.
- When the workspace is dirty and the task is large, ask whether to create an isolated worktree. Never nest worktrees.

## During work

- Keep changes scoped to the requested behavior, with formatting churn out of a behavior change.
- Review `git diff` before finishing significant work.

## Commits

Commit when the user asks. When the conversation shifts to a new domain with unstaged work from the last one, suggest committing first.

One logical change per commit. Before committing, review `git diff --staged` so it carries only the intended change, with no debug logs, commented-out code, secrets, or unrelated files. Write the message in conventional-commit form:

- `<type>(<scope>): <short description>`, with an optional body. Types: `feat`, `fix`, `chore`, `refactor`, `test`, `docs`, `ci`, `perf`.
- `<scope>` is module or path context, as in `feat(auth): add token refresh`, separated by the colon alone with no other punctuation.
- Description stays lowercase, imperative, no trailing period, and carries no issue or PR number.
