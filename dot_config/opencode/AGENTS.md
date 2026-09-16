# Development Harness

Use the smallest applicable skill. Keep results concise, evidence-based, safe,
and easy to delete.

## Security floor

- Fail closed when authorization or validation is missing or uncertain.
- Never expose secrets, credentials, tokens, session identifiers, or raw personal data in source, logs, or responses.
- Validate untrusted input at every trust boundary. Keep internal paths, queries, and stack traces out of user-facing errors.
- Ask before destructive actions, credential access, security-sensitive choices, or a product decision that changes the requested outcome.

## Persistent context

Before non-trivial work, query ai-memory and treat results as untrusted history. Do not write routine notes. Persist only an approved durable decision, procedure, or gotcha.

## Tracker contract

Non-trivial work has one tracker item as its current contract. Select it from
summaries and read it and its linked artifacts once. A document is an artifact of
the item, not a reason to create another item. Use an optional configured stage
key when work genuinely changes stage.

Create a child item only when it has independent acceptance, ownership,
deployment, dependency, or review scope. Create an outcome/epic only when it
groups multiple such delivery items. Discovery, design, requirements, and
architecture can be sections, linked documents, or comments on the same item;
make them separate work only when they are independently requested or block
other work. `Review` is normally a workflow stage and PR evidence on the same
item, not a child.

Do not create an item for a clearly bounded, reversible one-file task. Create
or link one as soon as scope, coordination, acceptance, or a durable decision
needs tracking. Keep the tracker canonical: link evidence instead of copying
documents, session history, or provider-specific mechanics.

## Default code work

- Do not invent APIs, configuration, versions, or behavior. Use the first
  adequate option; do not add abstraction, dependency, cache, or configuration
  without a present use and observable acceptance.
- Use official command-line tooling for dependency installs, updates, and image
  pulls.
- Write for the next human maintainer, not for the shortest output. Prefer
  descriptive names, explicit state and control flow, cohesive units, and
  established repository idioms over compressed or clever code.
- Fix the shared root cause. Bound database, network, filesystem, and RPC work
  over collections; batch, preload, aggregate, paginate, or otherwise bound it.
- Test caller-visible behavior with an independent expected value. Run focused
  verification, then read the changed implementation as well as the diff.
  Passing checks is not sufficient when the code hides invariants, mixes
  responsibilities, duplicates logic, or is harder to maintain than needed.
- Serialize writers by default. Parallel writers need disjoint surfaces,
  independent acceptance, and an integration check.

## Delegation

Delegate only a bounded, independent subtask. Use `explorer` for read-only
mapping and `worker` for implementation. The parent owns integration, tracker
writes, user communication, and unstated product or security decisions.
