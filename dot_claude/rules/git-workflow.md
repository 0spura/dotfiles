# Git Workflow

## Commit Message Format

```
<type>: <description>

[optional body]
```

Types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`, `ci`

Good: `fix: prevent race condition in auth token refresh`
Bad: `fix stuff`, `WIP`, `changes`, `update`

## Commit Discipline

- One logical change per commit
- Never commit: debug logs, `console.log`, hardcoded secrets, commented-out code
- Verify with `git diff --staged` before every commit

## Pull Request Workflow

- Review full commit history (`git diff [base]...HEAD`), not just the latest commit
- PR title: under 70 characters, describes the change
- Include a test plan in the PR body
- Use `-u` flag when pushing a new branch: `git push -u origin branch-name`

## Branch Naming

- `feat/short-description`
- `fix/short-description`
- `chore/short-description`
- `refactor/short-description`
