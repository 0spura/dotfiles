---
name: documentation-style
description: Write concise, durable technical documentation, architecture records, README content, and explanatory comments with consistent terms and verifiable statements.
---

# Documentation Style

Use this skill for documentation another person or agent must use, maintain, or verify.

## Workflow

1. Identify owner, audience, scope, inputs, outputs, and verification before editing.
2. Keep only facts, decisions, procedures, constraints, and evidence that change future work. Link canonical sources instead of duplicating them.
3. Use consistent terms, concrete statements, explicit assumptions, and measurable acceptance. Put conditional detail in references.
4. Review links, paths, contradictions, stale claims, and missing stop conditions.

## Codex skill rules

- Start `SKILL.md` with YAML frontmatter containing `name` and a concise `description`.
- Make `description` say what the skill does and when it should trigger. Include a boundary when it prevents false activation.
- Write the body as imperative instructions. Define inputs, workflow, output, verification, and when to ask or stop.
- Keep `SKILL.md` focused; move templates, policies, background, and deterministic tooling to adjacent resources.
- Keep `agents/openai.yaml` for display metadata, invocation policy, and declared tool dependencies. It is not a second instruction file.

## Editing standard

- A code comment explains a non-obvious constraint, rule, algorithm, or external quirk; it never narrates syntax.
- Delete filler, repeated guidance, synonym variation, and aspirational statements that bind no work.
- Prefer links to canonical documents over repeated content. Preserve stable identifiers and existing links.
- Do not claim that a command passed unless it was run; report unknowns as unknowns.
