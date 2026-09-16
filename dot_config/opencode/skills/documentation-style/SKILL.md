---
name: documentation-style
description: Write concise, durable technical documentation, architecture records, README content, and explanatory comments with consistent terms and verifiable statements.
---

# Documentation Style

Use this skill for documentation another person or agent must use, maintain, or verify.
When documentation is a work artifact, read its linked tracker item and return
the canonical path and verification to the caller.

## Workflow

1. Identify audience, scope, owner, and verification.
2. Keep only facts, decisions, constraints, procedures, and evidence that
   change future work; link canonical sources instead of copying them.
3. Use consistent terms, explicit assumptions, and measurable acceptance.
4. Check links, paths, contradictions, stale claims, and stop conditions.

## Skill authoring rules (OpenCode)

- Start `SKILL.md` with YAML frontmatter containing `name` (must equal the
  directory name, `^[a-z0-9]+(-[a-z0-9]+)*$`) and a concise `description`
  (1-1024 chars) saying what the skill does and when it triggers.
- Optional frontmatter: `license`, `compatibility`, `metadata` (string map).
  Unknown frontmatter keys are ignored by OpenCode.
- Write the body as imperative instructions. Define inputs, workflow, output, verification, and when to ask or stop.
- Keep `SKILL.md` focused; move templates, policies, background, and deterministic tooling to adjacent `reference/` resources.
- Do not create `agents/openai.yaml` (Codex-only display metadata); agent
  invocation policy lives in `dot_config/opencode/agents/*.md` frontmatter
  (`mode`, `permission`).

## Editing standard

- A code comment explains a non-obvious constraint, rule, algorithm, or external quirk; it never narrates syntax.
- Delete filler, repeated guidance, synonym variation, and aspirational statements that bind no work.
- Prefer links to canonical documents over repeated content. Preserve stable identifiers and existing links.
- Do not claim that a command passed unless it was run; report unknowns as unknowns.
