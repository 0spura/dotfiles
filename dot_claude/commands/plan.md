Produce a complete, executable implementation plan before writing any production code.

Run after /brainstorm or when the approach is already clear and only execution is needed.

## Plan Structure

Every plan must include:

1. **Goal** — one sentence: what this achieves and why
2. **Architecture** — what changes at the system level
3. **Tech stack** — languages, frameworks, libraries involved
4. **File map** — every file being created or modified, with what changes in each
5. **Tasks** — numbered, ordered, 2-5 minutes each (see below)
6. **No placeholders** — every task contains actionable, complete content

## Task Format

Each task must follow the TDD cycle:

```
Task N: <description>
File: path/to/file.ext

Test (write first — must fail before implementation):
<complete test code>

Implementation:
<complete implementation code>

Verification:
<exact command to run> → expected output
```

**Zero placeholders. Zero "similar to Task N". Zero "add error handling here".** If a task references a type or function defined elsewhere, that definition must appear in an earlier task.

## Self-Review Before Saving

Before saving the plan, verify:
- Every requirement maps to a task
- No TODO, TBD, or vague instructions remain
- Type and function names are consistent across all tasks
- Each task's verification command produces a deterministic output

## Save and Offer Execution Modes

Save plan to `docs/plans/YYYY-MM-DD-<feature-name>.md`, then offer:

- **Subagent-driven** (recommended) — dispatch a fresh agent per task with isolated context
- **Inline** — execute tasks sequentially in the current session with checkpoints
