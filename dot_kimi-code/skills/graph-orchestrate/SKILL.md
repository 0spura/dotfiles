---
name: graph-orchestrate
description: Model multi-agent workflows as graphs using Kimi Code's AgentSwarm and Agent tools. Use for parallel reviews, independent task batches, and map-reduce pipelines.
whenToUse: Use when a workflow has independent subtasks that can run in parallel, or when you need to coordinate multiple agents through a deterministic graph of fan-out, fan-in, and loops.
---

# Graph Orchestration

Model agent workflows as graphs. Nodes are subtasks; edges are control flow. Kimi Code does not have a native graph engine, so we emulate graphs with `Agent` (sequential nodes) and `AgentSwarm` (parallel fan-out).

## When to graph

- Multiple independent reviews of the same artifact (fan-out, fan-in).
- A batch of similar tasks over different items (map-reduce).
- A pipeline where each stage's output feeds the next (sequential chain).
- A review-fix loop that repeats until a gate passes.

## Graph primitives

### Fan-out / Map

Use `AgentSwarm` when nodes share the same shape and are independent. Each item becomes one subagent.

```
AgentSwarm
- prompt_template: "Review this diff for {{item}} issues: ..."
- items: ["bugs", "security", "spec-fidelity"]
- subagent_type: code-reviewer
```

Rules:
- Nodes must be independent: no shared mutable state, no ordering dependency.
- Each node returns a self-contained result the parent can merge.
- Limit items to what you can merge. Too many parallel results overflow context.

### Fan-in / Reduce

After `AgentSwarm` returns, merge results before the next stage:

1. Group findings by severity or category.
2. Deduplicate identical issues across nodes.
3. Produce one consolidated artifact for the next node.

A reduce step is a single `Agent` call or your own reasoning turn.

### Sequential chain

Use `Agent` when node B depends on node A's output.

```
Agent A -> result A
Agent B (receives result A) -> result B
Agent C (receives result B) -> result C
```

Keep chains short. If a chain grows past three nodes, consider whether some nodes can fan out instead.

### Review-fix loop

A cyclic graph: review -> fix -> re-review until gate passes.

```
1. AgentSwarm reviews in parallel.
2. Merge findings.
3. If no critical/warning findings: exit.
4. Agent applies fixes.
5. Re-run review swarm targeting regressions only.
6. Repeat from step 2 with a max iteration guard.
```

Always cap loops. A loop without a max iteration guard is a runaway graph.

## State discipline

- Immutable inputs: pass the full context each node needs; do not let nodes read each other's scratch state.
- Shared output: the parent owns aggregation. Nodes return, they do not coordinate.
- No side effects in fan-out: nodes in a swarm must not write to the same files.

## Choosing Agent vs AgentSwarm

| Pattern | Tool | Example |
|---|---|---|
| Independent same-shape tasks | `AgentSwarm` | review 3 axes of one PR |
| Different specialized tasks | `Agent` | implementation -> pull-request |
| Depends on previous output | `Agent` chain | architecture -> srs -> implementation-plan |
| Iterate until gate | `Agent` + `AgentSwarm` loop | review -> fix -> re-review |

## Anti-patterns

- Fan-out with dependent nodes: parallel tasks that need each other's results will race.
- Fan-out with shared writes: two swarm nodes editing the same file corrupt state.
- Deep nesting: `AgentSwarm` inside a subagent is possible but hard to reason about. Keep orchestration at the parent level.
- Forgetting the reduce: raw outputs from 10 subagents are unusable. Always merge.

## Done When

The graph is expressed as a sequence of `Agent` and `AgentSwarm` calls, each node has a clear input and output, parallel nodes are independent, and every loop has a max iteration guard.
