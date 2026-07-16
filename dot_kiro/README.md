# dot_kiro

Kiro CLI configuration for code-focused development workflows. Symlinked to `~/.kiro`.

## Setup

```bash
ln -sf ~/Projects/personal/dotfiles/dot_kiro ~/.kiro
```

## Structure

```
dot_kiro/
├── steering/              # Always loaded into every session (default agent auto-loads these)
│   ├── working-approach.md    # Scope, output format, security floor
│   ├── prose-voice.md         # Natural writing cadence
│   ├── engineering-defaults.md # Living docs, tracker discipline
│   ├── git-workflow.md        # Commits, branches, workspace safety
│   ├── code-craft.md         # Task discipline: scope, verify, report
│   └── code-standards.md     # Quality bar: simplicity, tests, secure-by-construction
├── skills/                # On-demand (loaded when the agent decides they're relevant)
│   ├── architecture-design/   # + reference/ (template, deep-modules)
│   ├── srs/                   # + reference/ (template)
│   ├── adr/
│   ├── pull-request/
│   ├── implementation-plan/   # + reference/ (feature, refactor, bug, perf templates)
│   ├── implementation/        # + reference/ (parallel-execution)
│   ├── brainstorming/         # + reference/ (vision-template)
│   ├── grill-me/
│   └── design-principles/
└── agents/                # Specialized agents (switch with /agent <name>)
    ├── code-reviewer.json     # Diff review → prioritized findings
    ├── security-review.json   # Input-to-sink security audit
    ├── debug.json             # Reproduce → isolate → regression test → fix
    ├── perf.json              # Baseline → profile → optimize → measure
    ├── implement-item.json    # TDD single work item execution
    ├── apply-review.json      # Applies reviewer findings as fixups
    ├── spec-review.json       # Diff vs. SRS fidelity check
    ├── product-discovery.json # Market research or internal tool brief
    ├── project-audit.json     # Derive docs from existing codebase
    └── ux-design.json         # Interface structure and flows
```

## How it works

**Steering** (`steering/`) = rules always in context. The `kiro_default` agent loads these automatically. Custom agents include them via `"file://~/.kiro/steering/**/*.md"` in their `resources`.

**Skills** (`skills/`) = knowledge loaded on demand. The agent sees the name and description; full content loads only when relevant. Referenced via `"skill://~/.kiro/skills/**/SKILL.md"`. A skill's `reference/` subfolder (templates, deep dives) is not auto-loaded by that glob; the agent reads a specific file with its `read` tool when the SKILL.md points to it.

**Agents** (`agents/`) = specialized personas with restricted tools and focused prompts. Switch during a session with `/agent code-reviewer`, or set a default with `kiro-cli settings chat.defaultAgent`.

## Typical workflow

1. Start with `kiro-cli chat` (default agent with all steering loaded)
2. Use skills naturally: ask to write an SRS, design architecture, plan implementation
3. Switch to specialized agents for focused work:
   - `/agent code-reviewer` before opening a PR
   - `/agent debug` when a test fails
   - `/agent perf` to optimize a hot path
4. The `pull-request` skill orchestrates: review → fix → re-review → open PR

## Differences from Claude Code equivalent

| Claude Code | Kiro CLI |
|---|---|
| `CLAUDE.md` + `rules/*.md` | `steering/*.md` (auto-loaded for default agent) |
| Agent frontmatter (YAML in .md) | Agent JSON file |
| `skills: [name]` in agent | `"skill://path"` in `resources` |
| `model: opus` | Not configurable per-agent in same way |
| `memory: project` | Not available (no MEMORY.md equivalent) |
| `permissionMode: acceptEdits` | `allowedTools` + `toolsSettings` |
