---
name: code-standards
description: "Apply the repository quality bar while writing or reviewing code: minimal changes, explicit errors, observable tests, secure boundaries, and maintainable structure."
---

# Code Standards

Apply these rules to changed code and review findings. Prefer repository conventions when they are stricter.

- Prefer the smallest solution in existing patterns. Use the standard library and existing helpers before dependencies or abstractions.
- Use early returns and explicit control flow. A comment explains a non-obvious rule, constraint, algorithm, or external quirk; it never narrates code.
- Give each file one responsibility. Stop for a new boundary the specification does not settle.
- Validate untrusted values at trust boundaries. Use allowlists, parameterized APIs, output escaping, and normalized paths constrained to an approved base.
- Authenticate and authorize each resource action separately. Missing checks fail closed. Never log credentials, raw personal data, authentication headers, or session IDs.
- Handle predictable failures explicitly. User errors are safe and actionable; internal logs contain diagnostic context without secrets.
- Test observable changed behavior and meaningful edge cases. Mock only external dependencies such as time, network, filesystem, or third-party services.
- A review finding needs a concrete failure mode or measurable cost. Do not report style preferences as defects.

Before reporting completion, inspect the diff, test changed behavior and meaningful edge cases, and report any skipped check with its reason.

When adding a dependency, use the repository package manager and installed API. Do not hand-write versions or introduce an abstraction without a present use. Keep one domain responsibility per file and split a growing specification at the same structural thresholds used by the relevant document skill.
