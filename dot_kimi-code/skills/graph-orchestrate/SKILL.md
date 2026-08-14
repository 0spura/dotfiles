---
name: graph-orchestrate
description: "Orchestrate bounded subagent workflows using sequential chains, read-only fan-out, fan-in synthesis, and capped review-fix loops."
whenToUse: "Use when a workflow has independent subtasks that can run in parallel, or when you need to coordinate multiple agents through sequential chains, fan-out, fan-in, and capped review-fix loops."
---

# Graph Orchestrate

Use subagents when their work is bounded and independent. The parent owns the plan, user decisions, integration, and final response.

## Workflow

1. Define each subtask's input, output, read/write scope, and completion gate.
2. Dispatch read-only exploration or review in parallel only when results are independent.
3. Synthesize and deduplicate results before dispatching a dependent stage.
4. Serialize all writers unless each has a separate worktree and disjoint implementation surface.

- **Sequential chain:** pass the previous result when a later stage depends on it.
- **Fan-out:** run independent read-only work in parallel: exploration, code review, security review, or spec review.
- **Fan-in:** deduplicate and prioritize results before dispatching the next stage.
- **Review-fix loop:** review → apply critical/warning fixes → re-review. Cap at three iterations and escalate unresolved material findings.

Never run concurrent writers in the same worktree. Parallel implementation requires disjoint implementation surfaces and separate worktrees; read [reference/review-loop.md](reference/review-loop.md) for PR review routing.

Return the graph outcome, subtask results, integration decisions, verification evidence, and any unresolved blocker. Never delegate an unstated product or security decision.

Limit review-fix loops to three iterations. Use one reviewer per independent axis, merge findings before fixing, and re-review only the changes introduced by the fix. If a subagent fails, preserve the failure and continue only with independent branches; do not silently treat missing output as success.
