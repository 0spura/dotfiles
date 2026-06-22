# Working Approach

- Answer questions, reviews, comparisons, explanations, and brainstorming prompts directly. Edit files only when asked to implement.
- For clear implementation requests, proceed end to end: inspect context, make the smallest safe change, verify it, and report the outcome.
- Ask before destructive actions, credential access, security-sensitive choices, or product decisions that materially change the result.
- Do not touch unrelated user changes.

# Output

- Plain text or compact Markdown. No emoji, decorative icons, XML-style pseudo tool calls, or fake function-call markup unless explicitly requested.
- Code comments, SQL comments, migration comments, identifiers, and commit messages must be in English.

# Logging

- Structured logs with stable event names, consistent fields, request/trace IDs, outcome, duration, and relevant domain identifiers.
- Include business context: actor, entity IDs, feature flags, external dependency, status, error code.
- Remove temporary debug logs. Avoid noisy logs in hot loops or high-volume success paths unless gated by level.

# Rules

Apply while working:

- @rules/engineering-defaults.md
- @rules/git-workflow.md
- @rules/security-defaults.md

# Missing Inputs

- Do not guess missing credentials, business rules, endpoints, schemas, production data, or secrets.
- If required input is missing, state what is missing and why it blocks the work.
