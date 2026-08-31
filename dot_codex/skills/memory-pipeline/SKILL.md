---
name: memory-pipeline
description: Use the configured ai-memory MCP server safely for cross-session product, requirement, architecture, implementation, review, and decision continuity.
---

# Memory Pipeline

Use this skill for memory routing and explicit persistence.

## Query

Search the current project first. If the result is empty or weak, broaden the query or search a named sibling project only when the user identifies one. Read the full page when a maintained decision, rule, gotcha, or procedure is relevant. Give useful or stale results explicit feedback when supported.

## Durable pages

Use namespaces by durable owner: `product`, `requirements`, `architecture`, `implementation`, `review`, `decisions`, and automatic `sessions`. Write only durable outputs: saved phase summaries, accepted decisions, recurring gotchas, or information the user explicitly asks to remember.

Each durable page starts with a Markdown H1 and records summary, artifacts, open questions, and context for a future session. Do not manually log routine observations; lifecycle hooks do that. Use a handoff only at session end or when explicitly requested.

## Completion

Report query scope, relevant page paths, and uncertainty. Stop when a missing decision materially changes the outcome.

Use `memory_query` before proposing a design or explaining prior behavior. Use `memory_read_page` for the complete text of a relevant maintained page. Use `memory_write_page` only for durable knowledge, with an H1 and a stable path; never use a handoff as a permanent note. Use `memory_handoff_begin` only at session end or when explicitly requested. Use `memory_auto_improve` only for an explicit learning review or wrap-up.
