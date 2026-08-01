---
name: graph-orchestrate
description: "Model multi-agent workflows as graphs using Kimi Code's Agent tool in foreground and background mode. Use for parallel reviews, independent task batches, and map-reduce pipelines."
whenToUse: "Use when a workflow has independent subtasks that can run in parallel, or when you need to coordinate multiple agents through a deterministic graph of fan-out, fan-in, and loops."
---

# Graph Orchestration

Model agent workflows as graphs. Nodes are subagent dispatches; edges are control flow you reason through explicitly. Kimi Code has no native graph engine and no swarm tool: every node is an `Agent` call, run in the foreground (blocking, sequential) or the background (`run_in_background: true`, concurrent). Background tasks surface through `TaskList`, `TaskOutput`, and an automatic completion notification; `TaskStop` cancels one that hangs.

**Hard constraint:** a dispatched subagent cannot itself call `Agent` — nesting is blocked by the platform, not just discouraged. Orchestration only happens at the parent (or a dedicated orchestrator skill like **implementation**), never inside a subagent you dispatched.

## When to graph

- Multiple independent reviews of the same artifact (fan-out, fan-in).
- A batch of similar tasks over different items (map-reduce).
- A pipeline where each stage's output feeds the next (sequential chain).
- A review-fix loop that repeats until a gate passes.

## Graph primitives

### Fan-out / Map

Dispatch one `Agent` call per independent node with `run_in_background: true`. Each call returns a task ID immediately instead of blocking; issue the next node's call right after instead of waiting.

```
Agent(subagent_type: code-reviewer, prompt: "...", run_in_background: true) -> task A
Agent(subagent_type: security-review, prompt: "...", run_in_background: true) -> task B
Agent(subagent_type: spec-review, prompt: "...", run_in_background: true) -> task C
```

Rules:
- Nodes must be independent: no shared mutable state, no ordering dependency.
- Each node returns a self-contained result the parent can merge.
- Limit items to what you can merge. Too many parallel results overflow context.
- Never fabricate a result while waiting; a completion notification or `TaskOutput` is the only source of truth.

### Fan-in / Reduce

Collect each node's result as its completion notification arrives, or call `TaskOutput` for a task ID that has gone quiet. Use `TaskList` to re-enumerate task IDs if you lose track, and `TaskStop` to cancel a node that is no longer needed (loop guard tripped, or the caller changed scope). Then:

1. Group findings by severity or category.
2. Deduplicate identical issues across nodes.
3. Produce one consolidated artifact for the next node.

A reduce step is your own reasoning turn, not another `Agent` call.

### Sequential chain

Dispatch `Agent` in the foreground (the default; omit `run_in_background` or set it `false`) when node B needs node A's finished output.

```
Agent A (foreground) -> result A
Agent B (foreground, receives result A) -> result B
Agent C (foreground, receives result B) -> result C
```

Keep chains short. If a chain grows past three nodes, consider whether some nodes can fan out instead.

### Review-fix loop

A cyclic graph: review -> fix -> re-review until gate passes. See `reference/review-loop.md` for the concrete PR review graph.

Always cap loops. A loop without a max iteration guard is a runaway graph; use `TaskStop` on any node still running once the guard trips.

## State discipline

- Immutable inputs: pass the full context each node needs; do not let nodes read each other's scratch state.
- Shared output: the parent owns aggregation. Nodes return, they do not coordinate.
- No side effects in fan-out: background nodes must not write to the same files or branch. A node that writes runs on its own worktree (see `implementation`'s `reference/parallel-execution.md`); a node that only reads (reviewers) has nothing to collide over.

## Choosing foreground vs background

| Pattern | Dispatch | Example |
|---|---|---|
| Independent same-shape tasks | `Agent` x N, `run_in_background: true` | review 3 axes of one PR |
| Different specialized tasks in sequence | `Agent`, foreground | implementation -> pull-request |
| Depends on previous output | `Agent` chain, foreground | architecture -> srs -> implementation-plan |
| Iterate until gate | background fan-out + foreground fix, repeated | review -> fix -> re-review |

## Anti-patterns

- Fan-out with dependent nodes: parallel tasks that need each other's results will race.
- Fan-out with shared writes: two background nodes editing the same file corrupt state.
- Nesting `Agent` inside a dispatched subagent: blocked by the platform. Keep orchestration at the parent level.
- Forgetting the reduce: task IDs from N background nodes are unusable until you collect and merge them.

## Done When

The graph is expressed as a sequence of foreground and background `Agent` calls, each node has a clear input and output, background nodes are independent, and every loop has a max iteration guard.
