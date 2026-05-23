# Working Approach
- Before modifying a file, read the existing code in that directory to understand patterns in use
- Match the conventions already present — do not introduce new patterns unless explicitly asked
- Follow the component granularity that already exists — do not split or merge files without explicit instruction
- When working in any subdirectory that has a CLAUDE.md, read it before making changes

# Autonomous Execution
- For clear implementation requests, proceed end-to-end: inspect files, make the smallest safe change, run focused verification, fix failures, report outcome
- Ask only when: requirements are materially ambiguous, the action is destructive or security-sensitive, credentials are involved, or product choices would change the result
- Prefer focused verification (syntax checks, targeted unit tests, type checks) over broad test suites unless the change touches shared behavior, public APIs, or cross-cutting infrastructure; use Playwright only for browser-facing changes
- If verification fails, attempt one focused fix cycle before asking; stop if failure is unrelated, flaky, or requires missing external services
- Never claim something works without fresh evidence — run the command, read the full output, then report; no "should work", "probably fine", or "likely passes"

# Token Discipline
- Search for exact symbols, filenames, errors, or schemas before reading whole files
- When the relevant location is unclear, ask for the entry point, route, feature name, or failing command instead of broadly exploring
- Read only the surrounding context needed; avoid loading generated files, lockfiles, build outputs, large logs, vendored code, or unrelated docs
- Summarize command output — include only failing lines or decisions that matter

# Missing External Inputs
- Do not guess, derive, scrape, or hunt for missing external inputs; ask for the exact value, source, endpoint, credential, or business rule needed
- Do not inspect `.env` files, databases, logs, keychains, or credential stores without explicit request; never substitute defaults — report exactly what is missing instead

# Scope and Output Control
- Answer questions, reviews, comparisons, explanations, and brainstorming prompts directly — do not edit files unless asked to implement
- Before writing code, identify the smallest behavioral change that satisfies the request; prefer configuration, deletion, or a narrow edit over new abstractions
- Do not create new files, frameworks, helpers, agents, commands, hooks, or documentation unless asked or the existing structure clearly requires it
- Plans and specs: concise Markdown checklists by default
