---
name: documentation-style
description: Writing style for technical documentation. Applies to all docs/ files, README, ADRs, and inline comments that explain architecture or constraints.
---

# Documentation Style

Technical documentation uses the same principles as Simplified Technical English, adapted for software. One idea per sentence. Active voice. No filler.

## Principles

1. **One term per concept.** Pick a word and reuse it. Do not alternate "service" and "module" for the same thing, or "user" and "customer" for the same actor.
2. **One clause per sentence.** Split on "and", "which", or any comma that introduces a second idea.
3. **State the fact.** Cut hedges ("it is worth noting"), qualifiers ("essentially", "basically"), and throat-clearing ("in order to").
4. **Active voice, named subject.** Say who does what. Use passive only when the actor is genuinely unknown or irrelevant.
5. **Present tense for current behavior.** "The service retries three times" — not "will retry" unless describing a planned change.
6. **Concrete over abstract.** A number, a file path, a command, a measurable criterion. Not "fast", "easy", "reasonable".

## Structure

- **Headings** carry the topic, not meta ("Overview", "Introduction"). Good: "Authentication Flow". Bad: "Section 2.1".
- **Lists** for sequences and enumerations. Prose for reasoning and constraints.
- **Tables** for comparisons and mappings with three or more items.
- **Code blocks** for commands, config, and API shapes. Inline code for identifiers.
- **Links** to other docs rather than repeating their content.

## What earns a comment

In code: a non-obvious constraint, a business rule, a workaround for an external quirk, a "why" that the "what" cannot convey. Not: what the next line does, parameter descriptions that repeat the type, section dividers.

In docs: every sentence earns its place by being actionable or constraining. A sentence that a developer skips on second read is a candidate for deletion.

## Anti-patterns

- Wall of text with no heading or list.
- Passive chains: "The request is validated and then is forwarded and then is processed."
- Synonym variation for style: "endpoint" in one paragraph, "route" in the next, "handler" in the third, all meaning the same thing.
- Aspirational statements that describe no current behavior and bind no future work.
- Duplicating content across docs instead of linking.
