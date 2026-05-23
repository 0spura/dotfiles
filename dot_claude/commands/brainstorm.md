Explore an idea, feature, or problem space before committing to any solution.

**Hard gate: do NOT write code, scaffold files, or take any implementation action until a design has been presented and explicitly approved by the user.**

## Process

**1. Explore project context**
Read relevant existing files and documentation to understand the codebase and constraints before asking anything.

**2. Ask clarifying questions — one at a time**
Ask questions individually, never as a list. Prefer multiple-choice over open-ended. Wait for the answer before asking the next. Continue until the goal and constraints are clear.

**3. Propose 2-3 distinct approaches**
Present alternatives with explicit trade-offs: what each gains, what it costs, what it forecloses. No false balance — if one stands out, say so.

**4. Present design incrementally with approval gates**
Break the design into logical sections. Present one section, wait for approval, then proceed to the next. Do not dump the entire design at once.

**5. Save the design**
Save the approved design to `docs/specs/YYYY-MM-DD-<topic>-design.md`.

**6. Dispatch spec-document-reviewer**
Invoke the `spec-document-reviewer` agent on the saved spec file. It checks:
- **Completeness** — every stated requirement has a corresponding design decision
- **Consistency** — no contradictions between sections or between spec and context
- **Clarity** — ambiguous terms are defined, interfaces are fully specified
- **Scope** — no YAGNI violations, no gold-plating, no deferred items presented as done
Fix any issues silently. Do not re-present corrected sections to the user.

**7. Invoke /plan**
The only valid terminal state of brainstorming is invoking the planning workflow. Do not invoke any other implementation action.
