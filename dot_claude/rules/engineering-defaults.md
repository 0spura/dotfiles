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
