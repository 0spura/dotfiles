---
name: graph-orchestrate
description: Multi-agent workflow patterns for Kiro's subagent pipeline. Defines graph primitives (fan-out, fan-in, sequential chain, review loop) for orchestrating parallel and sequential agent work.
---

# Graph Orchestrate

Patterns for orchestrating multi-agent workflows using Kiro's subagent delegation model. The parent agent (orchestrator) delegates work to subagents that run as pipeline stages, either sequentially or in parallel.

## Kiro's Delegation Model

Kiro's subagent tool spawns child agents as pipeline stages. Each stage:
- Receives a task description and context
- Runs to completion with its own tool access
- Returns results to the parent via the summary tool
- Can depend on other stages (sequential) or run independently (parallel)

The orchestrator delegates and synthesizes. It never implements what a subagent should do.

## Graph Primitives

### 1. Sequential Chain

Stages run one after another, each receiving the prior stage's output.

```
[Stage A] → [Stage B] → [Stage C]
```

Use when: each stage's input depends on the previous stage's output.
Example: implement → review → fix → re-review.

### 2. Fan-Out (Parallel)

Multiple stages run simultaneously from the same input.

```
         ┌→ [Stage A]
[Input] ─┼→ [Stage B]
         └→ [Stage C]
```

Use when: stages are independent and their outputs do not conflict.
Example: code-review + security-review + spec-review on the same diff.

To fan out, delegate each subagent in the same orchestration step. Kiro runs them in parallel when they share no dependency.

### 3. Fan-In (Merge)

Collect results from parallel stages and synthesize.

```
[Stage A] ─┐
[Stage B] ─┼→ [Merge]
[Stage C] ─┘
```

The orchestrator receives each subagent's summary and merges the findings before the next step. Fan-in is implicit: when all parallel stages complete, the orchestrator resumes with their combined output.

### 4. Review-Fix Loop

A bounded cycle between a reviewer and a fixer, converging on zero critical findings.

```
[Review] → findings? → [Fix] → [Re-review] → findings? → ...
                  ↓ no findings
              [Done]
```

Bound: maximum 3 iterations. If findings persist after 3 rounds, escalate to the user. See `reference/review-loop.md` for the concrete PR review graph.

## Composing Graphs

Combine primitives into larger workflows:

```
[Implement] → Fan-Out([Code Review], [Security Review], [Spec Review])
           → Fan-In(merge findings)
           → [Apply Fixes]
           → Fan-Out([Re-review])
           → [Done or Escalate]
```

## Rules

1. **The orchestrator delegates, never implements.** It selects work, prepares context, dispatches, and synthesizes. Code and analysis happen in subagents.
2. **Bound every loop.** No unbounded retries. Set a max iteration count and an escalation path.
3. **Independence for parallelism.** Fan-out only when stages cannot conflict (disjoint files, disjoint concerns, read-only analysis).
4. **Minimal context per stage.** Pass only what the subagent needs. A code reviewer gets the diff and relevant specs, not the full session history.
5. **Synthesize at fan-in.** The orchestrator merges, deduplicates, and prioritizes findings before passing them on. Subagents do not see each other's output.
