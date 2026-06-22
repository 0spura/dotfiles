# Git Workflow

## Workspace Safety

- Check `git status --short` before substantial edits.
- Never revert, overwrite, or clean up changes you did not make unless explicitly asked.
- If the workspace is dirty and the task is large, ask whether to create an isolated worktree. Do not create nested worktrees.

## During Work

- Keep changes scoped to the requested behavior. Avoid mixing formatting churn with behavior changes.
- Review `git diff` before finishing significant work.

## Commits

Commit only when the user asks. When the conversation shifts to a new domain with unstaged changes from the previous work, suggest committing first.

One logical change per commit. Before committing:
- Review `git diff --staged`. No debug logs, commented-out code, hardcoded secrets, or unrelated files.
- Conventional commits: `<type>(<scope>): <short description>` with optional body.
  - Use `(<scope>)` for module or path context: `feat(auth): add token refresh` — never use em-dashes or other separators.
  - Types: `feat`, `fix`, `chore`, `refactor`, `test`, `docs`, `ci`, `perf`.
  - Description: lowercase, imperative, no period at the end.
  - Never include issue or PR numbers in the commit message.

## Pull Requests

Before opening or updating a PR:
- Review the full branch diff, not only the latest commit.
- Include a concise summary and test plan. Mention important risks, migrations, or follow-up work.
- Ask before posting review comments or PR comments on the user's behalf.
