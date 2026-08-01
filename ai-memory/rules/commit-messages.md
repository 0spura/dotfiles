# Conventional Commit Messages

Write commit messages in conventional-commit form.

- Format: `<type>(<scope>): <short description>`
- Types: `feat`, `fix`, `chore`, `refactor`, `test`, `docs`, `ci`, `perf`.
- Scope is module or path context, as in `feat(auth): add token refresh`.
- Description stays lowercase, imperative, no trailing period, and carries no issue or PR number.
- One logical change per commit.
- Review `git diff --staged` before committing so the commit carries only the intended change, with no debug logs, commented-out code, secrets, or unrelated files.
