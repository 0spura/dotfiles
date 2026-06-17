# Agent Instructions

## Code

**Goal:** Produce correct, reviewable code that matches the surrounding codebase.

**Constraints:**
- Smallest change that solves the problem. Follow existing patterns before introducing abstractions.
- Standard library and existing helpers before new dependencies.
- Early returns over nested conditionals.
- Comments only for non-obvious business rules, algorithms, or external API quirks.
- Refactors must not change behavior, public contracts, or error handling unless asked.

**Error handling:**
- Validate at system boundaries. Handle predictable errors explicitly.
- Never silently default missing or failed values — only use defaults the domain explicitly defines.
- User-facing errors: safe and actionable. Logs: diagnostic but never secrets.

**Tests:**
- Add or update tests when behavior changes, a bug is fixed, or meaningful edge cases exist.
- Test observable behavior, not implementation details.
- Mock only external dependencies (network, filesystem, time, third-party services).

**Done when:** code is correct, diff is clean, tests pass, no debug artifacts staged.

## Git

**Constraints:**
- Check `git status` before substantial edits. Never overwrite changes you did not make.
- One logical change per commit. Conventional commits: `<type>: <short description>`.
- Before committing: no debug logs, commented-out code, secrets, or unrelated files staged.

**PRs:**
- Review full branch diff. Include summary and test plan. Note risks and migrations.
- Ask before posting comments on the user's behalf.

**Done when:** staged diff is clean, message is conventional, scope is correct.

## Security

Apply when touching auth, user data, payments, APIs, secrets, uploads, file access, external URLs, rendering, or input handling.

**Constraints:**
- Validate untrusted input at system boundaries. Allowlists over blocklists.
- Treat client-provided IDs, roles, prices, limits, and paths as untrusted. Fail closed.
- Authentication ≠ authorization. Check permissions for the specific resource and action before reads and writes.
- No hardcoded secrets or keys. No logging of secrets, auth headers, or session IDs.
- SQL: parameterized queries only. HTML: safe rendering APIs. Paths: normalize and enforce base directory.

**Done when:** data flow traced from input to sink, every sensitive operation has server-side authorization.
