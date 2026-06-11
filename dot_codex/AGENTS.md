# Engineering Defaults

Write code so it already satisfies the review and simplification pass.

## Build Simply

- Prefer the smallest change that solves the requested problem.
- Follow existing project patterns before introducing new abstractions.
- Use standard library, framework primitives, and existing helpers before adding dependencies.
- Prefer explicit, readable code over clever compression.
- Avoid speculative abstractions, unused extension points, and future-proofing without current use.
- Keep functions focused. If a function is hard to name precisely, it is probably doing too much.
- Avoid god files: do not concentrate unrelated responsibilities, large workflows, schemas, constants, and helpers in one file. Split by cohesive domain or behavior when a file stops being easy to scan.
- Flatten control flow with early returns. Avoid deeply nested conditionals and nested ternaries.
- Use descriptive names that communicate intent, not just type.
- Preserve behavior when simplifying. Refactors should not change outputs, side effects, public contracts, or error behavior unless requested.

## Comments

- Prefer self-documenting names and structure.
- Add comments only for non-obvious business rules, algorithms, compatibility constraints, or external API quirks.
- Remove comments that restate obvious code, describe behavior that changed, or explain an implementation that no longer exists.

## Error Handling

- Validate external input at system boundaries.
- Handle predictable error cases explicitly.
- Use exceptions or broad catch blocks only around genuinely fallible boundaries such as network calls, parsing, filesystem, or third-party code.
- User-facing errors should be safe and actionable. Internal logs may include diagnostic context but never secrets.
- Preserve original error context as failures move through layers.
- At backend/API boundaries, return or log enough structured context to explain why the operation failed without leaking sensitive data.
- At frontend/UI boundaries, present higher-level messages that explain what failed and what the user can do next.
- Do not silently replace missing, failed, or unknown values with defaults.
- Use defaults only when the domain explicitly defines a safe fallback, and make that fallback visible in code.

## Tests

- Add or update tests when behavior changes, a bug is fixed, or the touched code has meaningful edge cases.
- Test observable behavior rather than implementation details.
- Mock only external dependencies such as network, filesystem, time, randomness, and third-party services.
- Cover null or empty inputs, boundaries, invalid input, and error propagation when relevant.
- If tests fail, fix the implementation unless the test is demonstrably wrong.

## Built-In Review

Before finishing significant changes:

- Check the result against the user's request or approved plan.
- Review the diff for bugs introduced by the changed lines.
- Simplify recently touched code while preserving behavior.
- Ignore issues a formatter, linter, type checker, or compiler would catch unless they block verification.
- Report only concrete risks with a plausible failure mode. Avoid nitpicks and low-confidence findings.

When receiving external code review feedback:

- Understand the requested change before implementing.
- Verify it against the codebase; external feedback is a suggestion to evaluate, not an order.
- Ask for clarification when an item is unclear.
- Push back with technical reasoning when feedback is wrong, unnecessary, or conflicts with prior decisions.
- Implement review fixes one item at a time, with focused verification when practical.

# Git Workflow

## Workspace Safety

- Check `git status --short` before substantial edits when working in a repo.
- Never revert, overwrite, or clean up changes you did not make unless explicitly asked.
- If the workspace is dirty and the task is large, ask whether to create an isolated worktree.
- Before creating a worktree, detect whether the current checkout is already isolated. Do not create nested worktrees.

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
- Use conventional commits: `<type>: <short description>`

## Pull Requests

Before opening or updating a PR:

- Review the full branch diff, not only the latest commit.
- Include a concise summary and test plan.
- Mention important risks, migrations, or follow-up work.
- Ask before posting review comments or PR comments on the user's behalf.

# Security Defaults

Apply when touching auth, authorization, user data, payments, public APIs, secrets, uploads, file access, external URLs, rendering, parsing, or input handling.

## Boundaries

- Validate untrusted input at system boundaries.
- Prefer allowlists over blocklists for accepted values, hosts, file types, and actions.
- Treat client-provided IDs, roles, prices, limits, paths, URLs, and ownership claims as untrusted.
- Fail closed when validation, authorization, or policy checks are missing or uncertain.

## Auth And Authorization

- Authentication is not authorization. Check permissions for the specific resource and action.
- Prevent IDOR by verifying resource ownership, tenant scope, or explicit access rights before reads and writes.
- Do not rely on hidden UI controls, route names, or client-side checks for security.
- For background jobs and service accounts, use least-privilege credentials instead of user tokens.

## Data Handling

- Do not hardcode secrets, tokens, passwords, API keys, private keys, or recovery codes.
- Do not log secrets, auth headers, session IDs, payment data, or sensitive personal data.
- User-facing errors must not expose stack traces, internal paths, queries, tokens, or infrastructure details.
- If a credential may have been exposed, stop and tell the user it must be rotated.

## Common Vulnerability Classes

- Injection: use parameterized queries and structured APIs; do not concatenate untrusted strings into SQL, shell commands, LDAP, templates, or queries.
- XSS: use safe rendering APIs and escaping; avoid raw HTML injection from untrusted content.
- SSRF: do not fetch user-controlled URLs without scheme, host, IP range, redirect, and allowlist checks.
- Path traversal: normalize paths and enforce that resolved paths stay within the allowed base directory.
- Unsafe deserialization: do not deserialize untrusted payloads with unsafe formats or loaders.
- Uploads: validate type, size, extension, storage path, and access policy; never execute uploaded content.
- CSRF: protect state-changing browser endpoints when cookie-based auth is used.
- Rate limits: add or preserve rate limits for public auth, signup, payment, webhook, and expensive endpoints.

## Review Before Finishing

For security-sensitive changes:

- Trace data from input to sink.
- Confirm every sensitive operation has authorization at the server boundary.
- Check failure behavior and default states.
- Search nearby code for the same risky pattern.
- Report remaining security assumptions and unverified risks clearly.
