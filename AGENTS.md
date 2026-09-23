# dotfiles

The chezmoi source tree for this machine's agent configuration. Nothing here is live until
`chezmoi apply`: edit the repository copy, apply, then read the deployed file back.

- `dot_omp/private_agent/` → `~/.omp/agent/`, with `private_config.yml` becoming `config.yml`.
- `dot_agents/skills/` → `~/.agents/skills/`, the only user-authored skill root: the `agents`
  provider scans `.agent/skills` and `.agents/skills` (project walk-up plus user home) and is on by
  default through `skills.enableAgentsUser` and `skills.enableAgentsProject`. `private_config.yml`
  disables every foreign provider, which does not turn the `agents` provider off: a skill deployed
  anywhere else is silently dead, and `skills.includeSkills` is only worth pinning when a denylist is
  not enough.

## Agents

`agents/` overrides the bundled `scout`, `reviewer`, `security-reviewer`, `task`, and `sonic`,
keeping the harness's own names so its task prompt, `/agents`, and spawn policy keep working. The
remaining definitions cover the contracts OMP does not ship: `advisor` and `design` (read-only
design and research) and `worker` and `fix` (bounded writers). `task` and `sonic` declare no `tools`
list — that is how full access is declared.

`advisor`, `design`, `fix`, `reviewer`, `security-reviewer`, and `worker` declare `blocking: true`,
so the parent waits for them even with async tasks on. `scout`, `task`, and `sonic` stay
non-blocking so the parent can fan them out.

They follow the format of the shipped definitions. `model` is a `@role` alias from `modelRoles`;
`task` and `hub` reach an agent through `spawns`, not through `tools`; and an explicit `tools` list
disables LSP unless `lsp` is listed. `find` and `ast_grep` are gated by `find.enabled` and
`astGrep.enabled`, both off by default, so no agent lists them: a listed tool that the gate keeps
off only misleads the reader. Turn the setting on first, then add the name.

`modelRoles` holds one role per harness feature (`plan`, `task`, `commit`, `tiny`, `advisor`,
`judge`, `web`) plus the capability tiers the agent definitions share, so one line retunes every
agent on a tier: `deep` for costly, hard-to-reverse decisions, `judgment` for bounded judgment work,
`bulk` for implementation volume, and `scan` for read-only mapping. The `advisor` role is the
harness feature, not the `advisor` agent, which runs on `@deep`.

## Skills

Keep every `SKILL.md` standalone: an agent autoloads it by name, the session sees only its
description, and `autoloadSkills` silently drops a name that matches nothing. Skills own procedures
and agents own contracts and output, so an agent that restates its autoloaded skill's steps is
duplication, and a shared rule lives in `RULES.md` or in the owning skill, never in both.

A subagent receives `RULES.md`, its own definition, and its autoloaded skills — never `AGENTS.md`.
So a rule that must bind a subagent lives in `RULES.md` or in the owning skill, and `AGENTS.md`
carries only what the parent alone can act on: delegation, the tracker contract, and approvals.
Nothing in `AGENTS.md` should describe the loader, the file layout, or which file holds what — the
agent reading it needs the rule, not the machinery.
