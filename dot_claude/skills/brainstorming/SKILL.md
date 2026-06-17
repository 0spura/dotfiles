---
name: brainstorming
description: "Use before building a feature or integration: explore workflows, edge cases, architecture direction, and behavior. Turn rough ideas into clear options, tradeoffs, and an approved design before implementation."
---

# Brainstorming

Use when the user wants to explore how something should work before building it. The goal is to converge on a useful next step, not produce a large document.

If there is no product context established yet (competitors, market position, ICP), suggest running **product-discovery** first. Brainstorming features without market grounding tends to produce ideas that are internally coherent but misaligned with what the market needs.

Do not implement, scaffold, or edit code while brainstorming unless the user explicitly moves to implementation.

**Stay within the stated scope.** If the user defined the problem, do not expand it. Resist the urge to surface adjacent concerns, related improvements, or "while we're at it" suggestions unless directly asked. Scope creep during brainstorming wastes the user's time and buries the actual question.

Ask one question at a time. Use multiple-choice when it helps the user answer quickly.

## Process

### 1. Understand Context

For an existing repo: skim relevant files, docs, and patterns before proposing anything. Stay focused on what affects the idea.

For a pure idea: identify the domain, target user, desired outcome, and known constraints from the user's description.

### 2. Clarify The Goal (only if needed)

If the scope, target, and constraints are already clear from the user's prompt, skip this step and move to options. Only ask when a missing piece would materially change the direction.

When clarification is needed, ask until these are clear: who is this for, what problem does it solve, what does success look like, what constraints matter, what is explicitly out of scope.

### 3. Explore Options

If the user already pointed to a direction, explore that direction — do not offer alternatives for the sake of completeness. Only present 2-3 options when the decision is genuinely open. For each option: what it is, when it works well, main tradeoff, risk. Lead with the recommended option when there is enough signal.

### 4. Shape The Design

Present a Markdown design using only the sections that fit the request:

Problem · Target user · Core use case · MVP scope · Non-goals · User flow · Functional requirements · Data or integration needs · Architecture direction · Operational concerns · Risks · Validation plan · Next steps

### 5. Get Approval

Ask if the design looks right. Revise if needed. Ask again only when the revised direction is meaningfully different.

On approval: suggest **srs** to formalize the requirements before architecture design begins. For very small scopes where requirements are already unambiguous, suggest **architecture-design** directly.
