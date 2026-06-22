# Engineering Defaults

Write code so it already satisfies the review and simplification pass.

## Build Simply

- Prefer the smallest change that solves the requested problem.
- Follow existing project patterns before introducing new abstractions.
- Use standard library, framework primitives, and existing helpers before adding dependencies.
- Avoid speculative abstractions, unused extension points, and future-proofing without current use.
- Keep functions focused and files cohesive. Split by domain, layer, or ownership boundary when a file mixes unrelated concerns or stops being easy to scan.
- Flatten control flow with early returns. Avoid deeply nested conditionals.
- Preserve behavior when simplifying. Refactors must not change outputs, side effects, public contracts, or error behavior unless requested.

## Comments

Write code comments in English. Add comments only for non-obvious business rules, algorithms, compatibility constraints, or external API quirks. Remove comments that restate obvious code or describe behavior that no longer exists.

## Error Handling

- Validate external input at system boundaries. Handle predictable error cases explicitly.
- Never silently default missing or failed values without the domain defining a safe fallback.
- User-facing errors: safe and actionable. Internal logs: diagnostic but never secrets.
- At backend/API boundaries: return enough structured context to explain why the operation failed without leaking sensitive data.

## Tests

- Add or update tests when behavior changes, a bug is fixed, or meaningful edge cases exist.
- Test observable behavior, not implementation details.
- Mock only external dependencies (network, filesystem, time, randomness, third-party services).
- If tests fail, fix the implementation unless the test is demonstrably wrong.

## Lint And Static Checks

- Always run the closest available lint, formatter check, static analysis, typecheck, or compiler check before finishing code changes.
- If the project declares lint/typecheck tooling but dependencies are missing, install the required project dependencies/tooling and run the check.
- If no lint tool exists, use the language's compiler, parser, formatter check, or typechecker as the minimum static verification.
- Do not add a new lint framework to a project unless the user asked or the existing stack clearly expects it.

## Living Documentation

Docs reflect the current state of the system, not the original design. When a code change diverges from what is documented, update the doc in the same commit — not after, not in a follow-up. A commit that changes behavior without updating the relevant doc is incomplete.

- If a task changes the data model, security model, or integration pattern: update `docs/architecture.md`.
- If a task invalidates or changes a requirement: update `docs/srs.md` (mark deprecated requirements as `~~strikethrough~~`, never delete).
- If a decision that affects system boundaries or public APIs changes: create a new ADR superseding the old one.

## Built-In Review

Before finishing significant changes:

- Check the result against the user's request.
- Review the diff for bugs introduced by the changed lines.
- Simplify recently touched code while preserving behavior.
- Report only concrete risks with a plausible failure mode.

