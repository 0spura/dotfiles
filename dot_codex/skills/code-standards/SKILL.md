---
name: code-standards
description: "Apply explicit code-quality checks while writing or reviewing code: focused changes, observable tests, secure boundaries, and bounded complexity."
---

# Code Standards

Apply these rules to changed code and review findings. Prefer stricter repository conventions. Require evidence at the caller-visible seam, not checklist completion.

## Correctness and design

- Derive behavior from requirements and independent acceptance evidence; a green suite alone is not proof.
- Keep responsibilities and ownership local. Prefer a small deep interface over speculative layers.
- Preserve compatibility, idempotency, atomicity, and failure semantics when they are contractual; test them at the seam.

- Prefer the smallest solution in existing patterns. Use the standard library and existing helpers before dependencies or abstractions.
- Use early returns and explicit control flow. A comment explains a non-obvious rule, constraint, algorithm, or external quirk; it never narrates code.
- Validate untrusted values at trust boundaries. Use allowlists, parameterized APIs, output escaping, and normalized paths constrained to an approved base.
- When a required input is absent or uncertain, fail explicitly and report the missing decision; never invent credentials, business rules, endpoints, schemas, production values, or secrets.
- Authenticate and authorize each resource action separately. Missing checks fail closed. Never log credentials, raw personal data, authentication headers, or session IDs.
- Handle predictable failures explicitly. User errors are safe and actionable; internal logs contain diagnostic context without secrets.
- For operational behavior, use structured logs with stable events, outcome, duration, and only diagnostic identifiers. Never log credentials, tokens, session IDs, raw personal data, or unnecessary payloads.
- Test observable changed behavior and meaningful edge cases at a public seam. Derive expected values from an independent requirement, worked example, known literal, or external contract. Mock only external dependencies such as time, network, filesystem, or third-party services.
- Treat a tautological test as harmful: it recomputes the production procedure, derives its expected value from the same algorithm, or only asserts private collaboration. Replace it with a caller-visible outcome and independent oracle.
- When changing a decision tree, audit its branch classes before adding another condition. Collapse branches with the same outcome around a shared invariant; extract a named policy only when it removes caller-visible branching. Report a material reduction in decision paths, or explain why the remaining cases differ.
- A review finding needs a concrete failure mode or measurable cost. Do not report style preferences as defects.

## Measurable signals

Use repository tooling when it exists; stricter repository limits win. These are investigation thresholds, not targets to game.

- A changed function above 20 cyclomatic or cognitive complexity needs simplification, a named policy, or an explanation of why its remaining cases differ.
- A threshold exception must name the reason, affected scope, and why refactoring would worsen correctness or maintainability; do not raise a threshold merely to make a check pass.
- A changed source file above 500 lines needs a responsibility check. Split only at a real ownership or dependency boundary; do not mechanically split a cohesive file.
- Prove changed behavior and risk paths. Do not chase a global coverage percentage or add tautological tests to raise it.
- When mutation testing is configured, run it for changed business, security, or data-integrity logic. A surviving mutant needs either a proving test or a documented reason it is equivalent or out of scope.
- Remove newly unreachable, unused, or duplicated code in the changed surface. If removal crosses the task boundary, report it as follow-up rather than expanding the change.
- `any`, `unknown`, and equivalent dynamic types may enter only at a trust boundary and must be narrowed or validated before they spread into domain logic.
- Do not add CRAP or Halstead targets without an existing repository tool and a demonstrated decision they improve.

Before reporting completion, inspect the diff, test changed behavior and meaningful edge cases, and report any skipped check with its reason.

When adding a dependency, use the repository package manager and installed API. Do not hand-write versions or introduce an abstraction without a present use. Keep one domain responsibility per file and split a growing specification at the same structural thresholds used by the relevant document skill.
