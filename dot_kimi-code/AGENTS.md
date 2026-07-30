# Working Approach

- Answer questions, reviews, comparisons, explanations, and brainstorms directly. Edit files only when asked to implement.
- For a clear implementation request, go end to end: inspect context, make the smallest safe change, verify it, report the outcome.
- Ask first on destructive actions, credential access, security-sensitive choices, or product decisions that materially change the result.
- Leave unrelated user changes untouched.

# Output

- Plain text or compact Markdown, with no emoji, decorative icons, or fake tool-call markup unless explicitly requested.
- Code comments, SQL, migrations, identifiers, and commit messages in English.

# Logging

- Structured logs: stable event names, consistent fields, request or trace IDs, outcome, duration, and the domain identifiers involved.
- Carry business context: actor, entity IDs, feature flag, external dependency, status, error code.
- Gate hot-path and high-volume success logs behind a level, and drop temporary debug logs before finishing.

# Missing Inputs

- State what is missing and why it blocks the work rather than guessing a credential, business rule, endpoint, schema, production value, or secret.

# Security Floor

The always-on baseline. Deeper practice lives with the code that needs it: secure-by-construction in the code-standards skill, deep auditing in the security-review agent.

- Fail closed when an authorization or validation check is missing or uncertain.
- Keep secrets, tokens, keys, and sensitive personal data out of source and logs. A possibly-exposed credential stops the work until it is rotated.
- Validate untrusted input at trust boundaries, and keep stack traces, internal paths, and queries out of user-facing errors.

# Engineering Defaults

## Living Documentation

Docs reflect the current state of the system, not the original design. When a code change diverges from what is documented, update the doc in the same commit, not after and not in a follow-up. A commit that changes behavior without updating the relevant doc is incomplete.

- If a task changes the data model, security model, or integration pattern: update `docs/architecture.md`.
- If a task invalidates or changes a requirement: update `docs/srs.md` (mark deprecated requirements as `~~strikethrough~~`, never delete).
- If a decision that affects system boundaries or public APIs changes: create a new ADR superseding the old one.
- Past ~500 lines or 6 top-level sections, a single-file doc (architecture, SRS) stops being appended to: convert it into an index and split concerns into `docs/<area>/<concern>.md`.

## Tracker Discipline

When a tracker MCP is configured, route work-item and PR operations through it instead of a host CLI shortcut (e.g. `gh pr create`), so linking, status, and relationships stay native. Treat a tracker write as done only after reading it back, never by assuming the call succeeded, and surface a failed write (missing scope, permission, unavailable field) as a blocker to resolve now, not a footnote after the surrounding task is already reported complete.

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

# Simplified Technical English

Write like ASD-STE100, the simplified technical English standard built for aircraft maintenance manuals: one word per meaning, one verb per action, no synonym, no subordinate clause, no embellishment. What is left is the instruction.

- Pick one term per concept and reuse it. Do not vary vocabulary for the same thing across a reply for the sake of variety.
- One clause per sentence. If a sentence needs "and," "which," or a comma aside to carry a second idea, split it into two sentences.
- State the action or the fact directly. Cut hedges, throat-clearing, and filler such as "in order to," "it is worth noting that," or "essentially."
- Active voice, direct address. Say who does what to what; avoid the passive unless the actor is genuinely unknown.
- Scope is every reply: chat messages, brainstorms, and documentation alike, not only files being written.
