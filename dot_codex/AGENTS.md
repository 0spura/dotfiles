# Agent Instructions

## Working Approach

- Answer questions, reviews, comparisons, explanations, and brainstorming prompts directly. Edit files only when asked to implement.
- For clear implementation requests, proceed end to end: inspect context, make the smallest safe change, verify it, and report the outcome.
- Ask before destructive actions, credential access, security-sensitive choices, or product decisions that materially change the result.
- Do not touch unrelated user changes.

## Output

- Plain text or compact Markdown. No emoji, decorative icons, XML-style pseudo tool calls, or fake function-call markup unless explicitly requested.
- Code comments, SQL comments, migration comments, identifiers, and commit messages must be in English.

## Code

**Goal:** Produce correct, reviewable code that matches the surrounding codebase.

**Constraints:**
- Smallest change that solves the problem. Follow existing patterns before introducing abstractions.
- Standard library and existing helpers before new dependencies.
- Early returns over nested conditionals.
- Keep file organization scalable. Do not put unrelated models, handlers, services, SQL, tests, and adapters into one catch-all folder; split by domain, layer, or ownership boundary following project conventions.
- Comments in English only, and only for non-obvious business rules, algorithms, or external API quirks.
- Refactors must not change behavior, public contracts, or error handling unless asked.

**Error handling:**
- Validate at system boundaries. Handle predictable errors explicitly.
- Never silently default missing or failed values — only use defaults the domain explicitly defines.
- User-facing errors: safe and actionable. Logs: diagnostic but never secrets.
- At backend/API boundaries: return enough structured context to explain why the operation failed without leaking sensitive data.

**Logging:**
- Design logs for querying, not just reading: stable event names, consistent fields, request/trace IDs, outcome, duration, and relevant domain identifiers.
- For request or job flows, prefer one canonical context-rich event per service hop over many scattered string logs. Enrich it through the flow and emit it at completion.
- Add business context needed for incident analysis: actor, tenant/account, entity IDs, feature flags, attempt count, external dependency, status, and error code.
- Keep useful high-cardinality fields for debugging. Manage volume with levels, sampling, or tail sampling instead of stripping context by default.
- Never log secrets, tokens, credentials, auth headers, session IDs, raw personal data, or full payloads unless explicitly safe and necessary.
- Remove temporary debug logs. Avoid noisy logs in hot loops or high-volume success paths unless gated by level or sampling.

**Tests:**
- Add or update tests when behavior changes, a bug is fixed, or meaningful edge cases exist.
- Test observable behavior, not implementation details.
- Mock only external dependencies (network, filesystem, time, randomness, third-party services).
- If tests fail, fix the implementation unless the test is demonstrably wrong.

**Lint and static checks:**
- Always run the closest available lint, formatter check, static analysis, typecheck, or compiler check before finishing code changes.
- If the project declares lint/typecheck tooling but dependencies are missing, install the required project dependencies/tooling and run the check.
- If no lint tool exists, use the language's compiler, parser, formatter check, or typechecker as the minimum static verification.
- Do not add a new lint framework unless the user asked or the existing stack clearly expects it.

**Living documentation:**
- If a task changes the data model, security model, or integration pattern: update `docs/architecture.md`.
- If a task invalidates or changes a requirement: update `docs/srs.md` (mark deprecated requirements as `~~strikethrough~~`, never delete).
- If a decision that affects system boundaries or public APIs changes: create a new ADR superseding the old one in `docs/adr/`.
- Update docs in the same commit as the code — never after, never in a follow-up.

**Done when:** code is correct, diff is clean, tests pass, no debug artifacts staged.

**Built-in review:** before finishing significant changes, check the result against the user's request, review the changed lines for bugs, simplify recently touched code while preserving behavior, and report only concrete risks with a plausible failure mode.

## Git

**Constraints:**
- Check `git status` before substantial edits. Never overwrite changes you did not make.
- If the workspace is dirty and the task is large, ask whether to create an isolated worktree. Do not create nested worktrees.
- Keep changes scoped to the requested behavior. Avoid mixing formatting churn with behavior changes.
- Review `git diff` before finishing significant work.
- Commit only when the user asks. When the conversation shifts to a new domain with unstaged changes from the previous work, suggest committing first.
- One logical change per commit. Conventional commits: `<type>(<scope>): <short description>`.
- Use `(<scope>)` for module or path context, for example `feat(auth): add token refresh`.
- Commit types: `feat`, `fix`, `chore`, `refactor`, `test`, `docs`, `ci`, `perf`.
- Commit descriptions are lowercase, imperative, and have no period at the end.
- Never include issue or PR numbers in commit messages.
- Before committing: no debug logs, commented-out code, secrets, or unrelated files staged.

**PRs:**
- Review full branch diff. Include summary and test plan. Note risks and migrations.
- Ask before posting comments on the user's behalf.

**Done when:** staged diff is clean, message is conventional, scope is correct.

## Security

Apply when touching auth, authorization, user data, payments, public APIs, secrets, uploads, file access, external URLs, rendering, parsing, or input handling.

**Constraints:**
- Validate untrusted input at system boundaries. Allowlists over blocklists.
- Treat client-provided IDs, roles, prices, limits, paths, URLs, and ownership claims as untrusted. Fail closed.
- Authentication ≠ authorization. Check permissions for the specific resource and action before reads and writes.
- Prevent IDOR by verifying resource ownership, tenant scope, or explicit access rights before reads and writes.
- Do not rely on hidden UI controls, route names, or client-side checks for security.
- For background jobs and service accounts, use least-privilege credentials instead of user tokens unless the design requires user delegation.
- No hardcoded secrets, tokens, passwords, API keys, private keys, or recovery codes.
- No logging of secrets, auth headers, session IDs, payment data, or sensitive personal data.
- User-facing errors must not expose stack traces, internal paths, queries, tokens, or infrastructure details.
- If a credential may have been exposed, stop and tell the user it must be rotated.
- Injection: use parameterized queries and structured APIs; do not concatenate untrusted strings into SQL, shell commands, LDAP, templates, or queries.
- XSS: use safe rendering APIs and escaping; avoid raw HTML injection from untrusted content.
- SSRF: do not fetch user-controlled URLs without scheme, host, IP range, redirect, and allowlist checks.
- Paths: normalize paths and enforce that resolved paths stay within the allowed base directory.
- Unsafe deserialization: do not deserialize untrusted payloads with unsafe formats or loaders.
- Uploads: validate type, size, extension, storage path, and access policy; never execute uploaded content.
- CSRF: protect state-changing browser endpoints when cookie-based auth is used.
- Rate limits: add or preserve rate limits for public auth, signup, payment, webhook, and expensive endpoints.

**Done when:** data flow traced from input to sink, every sensitive operation has server-side authorization.

## Missing Inputs

- Do not guess missing credentials, business rules, endpoints, schemas, production data, or secrets.
- If required input is missing, state what is missing and why it blocks the work.
