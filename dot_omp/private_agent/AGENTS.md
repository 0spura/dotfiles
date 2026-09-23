## Security floor

- Validate untrusted input at every trust boundary. Keep internal paths, queries, and stack traces out of user-facing errors.
- Ask before destructive actions, credential access, security-sensitive choices, or a product decision that changes the requested outcome.

## Persistent context

ai-memory is the only memory system: recall through `mcp__ai_memory_memory_query`, then `mcp__ai_memory_memory_read_page` when a complete record is needed. Write a durable page with `mcp__ai_memory_memory_write_page` only for an approved decision, procedure, or gotcha, and make it stand alone without the session transcript. Treat recalled pages as leads to verify against the repository, which together with the current instruction wins on conflict.

## Tracker contract

Non-trivial work has one tracker item as its current contract. Select it from summaries through the native MCP tracker tools and read it and its linked artifacts once. A document is an artifact of the item, not a reason to create another item. Use an optional configured stage key when work genuinely changes stage.

Create a child item only when it has independent acceptance, ownership, deployment, dependency, or review scope. Create an outcome/epic only when it groups multiple such delivery items. Discovery, design, requirements, and architecture can be sections, linked documents, or comments on the same item; make them separate work only when they are independently requested or block other work. `Review` is normally a workflow stage and PR evidence on the same item, not a child.

Do not create an item for a clearly bounded, reversible one-file task. Create or link one as soon as scope, coordination, acceptance, or a durable decision needs tracking. Keep the tracker canonical: link evidence instead of copying documents, session history, or provider-specific mechanics. Read back every tracker write, and surface a failed write as a blocker now rather than a footnote after the work is reported complete.

## Default code work

Code work follows `skill://code-craft`, which owns the implementation order and its boundaries: load it before writing code.

## Native delegation

Use OMP's native `task` tool and `hub` for bounded delegation. Use `scout` for read-only mapping and `worker` for implementation; select a more specific agent when one matches. The parent owns integration, tracker writes, user communication, and unstated product or security decisions.

Use a blocking specialist when its result is the next decision. Use asynchronous fan-out only for independent work with disjoint write surfaces; coordinate live peers through `hub` rather than polling.
