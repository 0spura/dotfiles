# Working Approach

- Answer questions, reviews, comparisons, explanations, and brainstorming prompts directly. Edit files only when asked to implement.
- For clear implementation requests, proceed end to end: inspect context, make the smallest safe change, verify it, and report the outcome.
- Ask before destructive actions, credential access, security-sensitive choices, or product decisions that materially change the result.
- Do not touch unrelated user changes.

# Output

- Plain text or compact Markdown. No emoji, decorative icons, XML-style pseudo tool calls, or fake function-call markup unless explicitly requested.
- Code comments, SQL comments, migration comments, identifiers, and commit messages must be in English.

# Verification

- Always run the most relevant lint, formatter check, static analysis, typecheck, or compiler check before finishing code changes. If required project tooling is missing, install the project-declared dependency/tooling needed to run it.

# Logging

- Prefer structured logs that are designed for querying: stable event names, consistent field names, request/trace IDs, outcome, duration, and relevant domain identifiers.
- For request or job flows, prefer one canonical context-rich event per service hop over many scattered string logs. Enrich it through the flow and emit it at completion.
- Include business context that explains impact and root cause: actor, tenant/account, entity IDs, feature flags, attempt count, external dependency, status, and error code.
- Keep high-cardinality fields when they are needed to debug real incidents. Control cost with log levels, sampling, or tail sampling; do not remove useful context by default.
- Never log secrets, tokens, credentials, auth headers, session IDs, raw personal data, or full payloads unless explicitly safe and necessary.
- Remove temporary debug logs. Avoid noisy logs in hot loops or high-volume success paths unless gated by level or sampling.

# Rules

Apply while working:

- @rules/engineering-defaults.md
- @rules/git-workflow.md
- @rules/security-defaults.md

# Missing Inputs

- Do not guess missing credentials, business rules, endpoints, schemas, production data, or secrets.
- If required input is missing, state what is missing and why it blocks the work.
