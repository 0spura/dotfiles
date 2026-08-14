---
name: documentation-style
description: Write concise, durable technical documentation, architecture records, README content, and explanatory comments with consistent terms and verifiable statements.
whenToUse: Use this skill for Markdown documentation, READMEs, architecture records, ADRs, and code comments that another person or agent must execute, maintain, or verify.
---

# Documentation Style

Use this skill for Markdown that another person or agent must execute, maintain, or verify.

## Workflow

1. Read the document, its referenced sources, and repository conventions before editing.
2. Identify the document's owner, audience, scope, inputs, outputs, and verification method.
3. Use one term per concept, one idea per sentence, active voice, present tense, and concrete facts.
4. Use headings that name subjects, numbered lists for sequences, bullets for independent rules, tables for comparisons, and links instead of duplicated text.
5. State commands, paths, ownership, limits, assumptions, and measurable acceptance criteria explicitly.
6. Move detailed schemas, examples, and long procedures to `reference/` when progressive disclosure helps. Link them from `SKILL.md` and state when to read them.
7. Review for stale paths, undefined terms, contradictory instructions, missing stop conditions, and unsourced claims.

## Kimi Code skill rules

- Start `SKILL.md` with YAML frontmatter containing `name`, a concise `description`, and `whenToUse`.
- Make `description` say what the skill does and `whenToUse` when it should trigger. Include a boundary when it prevents false activation.
- Write the body as imperative instructions. Define inputs, workflow, output, verification, and when to ask or stop.
- Keep `SKILL.md` focused; move templates, policies, background, and deterministic tooling to adjacent `reference/` resources.
- Keep frontmatter as routing metadata only. It is not a second instruction file.

## Editing standard

- A code comment explains a non-obvious constraint, rule, algorithm, or external quirk; it never narrates syntax.
- Delete filler, passive chains, synonym variation, and aspirational statements that bind no work.
- Prefer links to canonical documents over repeated content. Preserve stable identifiers and existing links.
- Do not claim that a command passed unless it was run; report unknowns as unknowns.
