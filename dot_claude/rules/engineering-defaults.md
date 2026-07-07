# Engineering Defaults

## Build Simply

- Prefer the smallest change that solves the requested problem.
- Follow existing project patterns before introducing new abstractions.
- Avoid speculative abstractions, unused extension points, and future-proofing without current use.
- Prefer the standard library, framework primitives, and existing helpers before adding a dependency. When one is genuinely needed, install it with the package manager's add command (`pnpm add`, `cargo add`, `uv add`, `go get`) instead of hand-writing a version string, so the resolver sets the version, lockfile, and integrity. Take the resolved version, respect the project's existing version policy, and do not force a major bump it did not ask for. Then code against the installed version's own API (types or local docs), not what you remember.
- Decide the file and directory layout before writing, not after a file sprawls. When a file mixes unrelated domains or grows hard to scan, split it by domain, layer, or ownership boundary. This applies to documentation and specs as much as to code: a growing spec becomes a directory of focused files with an index, never one god file.

## Error Handling

- Validate external input at system boundaries. Handle predictable error cases explicitly.
- Never silently default missing or failed values without the domain defining a safe fallback.
- User-facing errors: safe and actionable. Internal logs: diagnostic but never secrets.
- At backend/API boundaries: return enough structured context to explain why the operation failed without leaking sensitive data.

## Tests

- Add or update tests when behavior changes, a bug is fixed, or meaningful edge cases exist.
- If tests fail, fix the implementation unless the test is demonstrably wrong.

## Lint And Static Checks

- Always run the closest available lint, formatter check, static analysis, typecheck, or compiler check before finishing code changes.
- If the project declares lint/typecheck tooling but dependencies are missing, install the required project dependencies/tooling and run the check.
- If no lint tool exists, use the language's compiler, parser, formatter check, or typechecker as the minimum static verification.
- Do not add a new lint framework to a project unless the user asked or the existing stack clearly expects it.

## Living Documentation

Docs reflect the current state of the system, not the original design. When a code change diverges from what is documented, update the doc in the same commit, not after and not in a follow-up. A commit that changes behavior without updating the relevant doc is incomplete.

- If a task changes the data model, security model, or integration pattern: update `docs/architecture.md`.
- If a task invalidates or changes a requirement: update `docs/srs.md` (mark deprecated requirements as `~~strikethrough~~`, never delete).
- If a decision that affects system boundaries or public APIs changes: create a new ADR superseding the old one.

## Built-In Review

Before finishing significant changes:

- Check the result against the user's request.
- Review the diff for bugs introduced by the changed lines.
- Report only concrete risks with a plausible failure mode.
