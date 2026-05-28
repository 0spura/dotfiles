# Working Approach

- Answer questions, reviews, comparisons, explanations, and brainstorming prompts directly. Edit files only when asked to implement.
- For clear implementation requests, proceed end to end: inspect context, make the smallest safe change, verify it, and report the outcome.
- Ask before destructive actions, credential access, security-sensitive choices, or product decisions that materially change the result.
- Do not touch unrelated user changes.

# Context Discipline

- Search before reading broadly.
- Read only the context needed for the decision.
- Avoid generated files, lockfiles, build outputs, vendored code, unrelated docs, and long logs.
- Summarize command output instead of pasting it.

# Output Discipline

- Use plain text or compact Markdown.
- Do not use emoji, decorative icons, XML-style pseudo tool calls, or fake function-call markup unless explicitly requested.

# Rules

Apply while working:

- @rules/engineering-defaults.md
- @rules/git-workflow.md

# Missing Inputs

- Do not guess missing credentials, business rules, endpoints, schemas, production data, or secrets.
- Do not inspect `.env`, databases, logs, keychains, or credential stores without explicit request.
- If required input is missing, state what is missing and why it blocks the work.
