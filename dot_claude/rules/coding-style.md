# Coding Style Conventions

## Design Philosophy

- Favor simple, direct solutions over clever or complex ones — avoid over-engineering and unnecessary abstractions
- Use native language features and standard library before reaching for custom implementations or third-party libs
- Prefer self-documenting names over comments; comment only for complex business logic, non-obvious algorithms, or external API quirks

## Naming

- Follow the naming convention idiomatic to the language (e.g. `snake_case` in Rust and Python, `camelCase` in TypeScript)
- Names must be descriptive — convey intent, not just type (`marketSearchQuery`, not `q`)
- Functions should express what they do, not how (`fetchUserData`, not `doStuff`)

## Structure Limits

- Functions: ≤ 50 lines
- Files: ≤ 400 lines (hard limit 800)
- Nesting depth: ≤ 4 levels — flatten with early returns
- Organize by feature/domain, not by file type

## Immutability

- Always create new objects — never mutate in place
- No direct mutation of shared or external state

## Error Handling

- Handle errors explicitly at every level — no silent failures
- User-facing code: show friendly, actionable messages
- Server-side: log full context, return safe error responses
- Validate all external input at system boundaries
- Prefer explicit error checking over try/catch when error conditions are predictable
- Reserve try/catch (or equivalent) for genuinely exceptional operations: network calls, parsing, third-party code

## Control Flow

- No nested ternaries — use `if/else` or equivalent for multiple conditions
- A single flat ternary is fine when both branches are short and readable
- Prefer early returns to flatten nesting rather than else chains

## What to Avoid

- Magic numbers without named constants
- Functions that do more than one thing
- Speculative abstractions for hypothetical future use
- Commented-out code committed to the repo
- Dense one-liners that prioritize fewer lines over readability
