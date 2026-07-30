---
name: code-standards
description: The quality bar for code, covering simplicity, clarity, tests, and secure-by-construction.
disableModelInvocation: true
---

# Code Standards

## Write it clean the first time

You are the simplification pass, not its input. Code ships already legible, so a change that would need a rewrite to be read is unfinished. Clarity never alters what the code does.

## Simplicity

- The smallest change that solves the problem, in the project's existing patterns. Abstraction waits for a present use.
- Explicit over clever: early returns over deep nesting, an if/else chain or switch over nested ternaries. A comment earns its place on a non-obvious rule, algorithm, constraint, or external quirk.
- Add a dependency through the package manager (`pnpm add`, `cargo add`, `uv add`, `go get`), never a hand-written version, and code against the installed API. Reach for the standard library and existing helpers first.
- Settle a file's layout before it sprawls: one domain per file, split at the boundary when concerns mix. Specs follow the same rule, so a growing one becomes a directory with an index.

## Error handling

Validate external input at the boundary and handle predictable failures explicitly. A missing or failed value defaults silently only where the domain defines a safe fallback. User-facing errors stay safe and actionable; boundary responses carry enough structured context to explain the failure while internals stay hidden.

## Tests

Cover changed behavior, fixed bugs, and real edge cases. Assert observable behavior, mocking only external dependencies: network, filesystem, time, randomness, third-party services. A failing test means the implementation is wrong unless the test demonstrably is.

## Secure by construction

Build so the flaw never enters; the security-review agent traces input to sink for whatever slips past.

- Validate untrusted input at the boundary, and allowlist the accepted values, hosts, types, and actions.
- Every client-provided value (IDs, roles, prices, paths, URLs, ownership) is untrusted, and a missing check fails closed.
- Authentication is not authorization: authorize the specific resource and action, and confirm ownership or tenant scope before every read and write.
- Parameterize queries and use structured APIs; escape on output; keep resolved paths within an allowed base; validate external URLs by scheme, host, and redirect allowlist.
- Background jobs and service accounts run on least-privilege credentials.
