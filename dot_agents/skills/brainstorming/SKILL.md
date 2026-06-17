---
name: brainstorming
description: "Use before building a feature or integration: explore workflows, edge cases, architecture direction, and behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
---

# Brainstorming

**When to use:** User wants to explore how something should work before building. Trigger: "how should we approach", "brainstorm", "let's think through", "before I build", "help me design".

**Goal:** Converge on a design the user approves before any implementation starts.

**Constraints:**
- If no product context exists (competitors, market position, ICP), suggest **product-discovery** first.
- No implementation, code scaffolding, or file edits during brainstorming.
- Stay within the stated scope. Do not expand the problem or surface adjacent concerns unless asked.
- One question at a time. Use multiple-choice when it helps.
- No diagrams or visual output unless explicitly asked.
- Inspect the repo before asking questions the code answers.

**Process:**
1. Read relevant code, docs, and existing patterns.
2. Clarify only if a missing piece would materially change the direction. If scope is already clear, skip.
3. If the user pointed to a direction, explore it — don't offer alternatives for completeness. Only present 2-3 options when the decision is genuinely open.
4. Present a design: problem, core use case, MVP scope, non-goals, user flow, risks, next steps.
5. Get approval. Revise if needed.
6. Save the approved design to `docs/features/<feature-name>/design.md` using only the sections that fit:

```markdown
# Design — [Feature Name]

## Problem
What is broken or missing and who feels it.

## Core Use Case
The primary scenario this design addresses.

## MVP Scope
What is included in the first version.

## Non-Goals
What this design explicitly does not cover.

## User Flow
Step-by-step: how a user accomplishes the core use case.

## Risks
What could go wrong or invalidate this design.

## Next Steps
Immediate actions after approval.
```

**Done when:** Design saved and approved. Suggest **srs** to formalize requirements. For very small scopes where requirements are already unambiguous, suggest **architecture-design** directly.
