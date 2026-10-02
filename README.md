# dotfiles

A [chezmoi](https://www.chezmoi.io/) source tree: agent configuration, skills, and the per-machine
software bootstrap, applied locally on Fedora, macOS, and Windows. Every machine clones this
repository and runs `chezmoi` from the clone; nothing here is live until `chezmoi apply`.

## What it manages

| Target | Content |
| --- | --- |
| `~/.agents/skills/` | The canonical skill tree, deployed on every machine |
| `~/.omp/agent/` | OMP agent definitions, rules, and the per-machine config (written `private_`, so it never appears in diffs) |
| `~/.claude/`, `~/.kimi-code/`, `~/.kiro/` | Deployed only when that agent is selected in `enabledAgents`; no source tree for them exists yet |
| Fedora, macOS, Windows | Missing development tools, languages, and containers, plus optional ai-memory, OMP, and the workctl build |

Scripts are kept under `.chezmoiscripts/`, grouped first by execution phase and then by owner:
platform-specific setup is separate from optional components.

```text
.chezmoiscripts/
  10-platform/
    fedora/
    macos/
    windows/
  20-components/
    run_after_30-ai-memory.sh.tmpl
    run_after_40-omp.sh.tmpl
    run_after_50-workctl.sh.tmpl
```

ChezMoi executes `run_` scripts in these nested directories without deploying them.
The numbered phase prefixes keep platform setup ahead of optional component setup;
platform scripts stay grouped by OS, while each component script is directly visible.

## First run on a new machine

```sh
git clone https://github.com/0spura/dotfiles ~/Projects/dotfiles
cd ~/Projects/dotfiles
chezmoi init --source "$PWD"   # answers the prompts once and writes ~/.config/chezmoi/chezmoi.toml
chezmoi diff                   # preview files and the install scripts that would run
chezmoi apply
```

`--source "$PWD"` is what makes the first run read `.chezmoi.toml.tmpl` from the clone. The generated
config records that path as `sourceDir`, so every later run needs nothing but `chezmoi apply`. After
changing the repository:

```sh
git pull
chezmoi diff
chezmoi apply
```

Useful checks that change nothing:

```sh
chezmoi apply --dry-run --verbose   # render everything, run no script
chezmoi status                      # files that differ from the applied state
chezmoi ignored                     # repository-only paths kept out of the home directory
```

## Requirements and manual steps

- chezmoi v2 is required (this tree is verified with v2.70.4); install it before the first run.
- Fedora: the install scripts use `sudo`. The first apply that installs Docker CE adds you to the
  `docker` group, which takes effect after the next login.
- macOS: Homebrew must already be installed. The scripts install OrbStack, `node@24`, `openjdk@21`,
  `rust`, and `python`, and never upgrade what is already there.
- Windows: only the Docker Desktop installer runs. It needs the WSL 2 features, which require one
  elevated PowerShell command and possibly a restart, plus WSL 2.1.5 or newer; the script prints the
  exact step and stops when one is missing. Docker's terms stay a manual acceptance.

The install scripts run on every `chezmoi apply` and are idempotent. They install what is missing and
never update, replace, or remove software they did not install themselves.

## Secrets

Nothing secret is committed. Provider API keys and the ai-memory auth token live only in
`~/.config/chezmoi/chezmoi.toml` on the machine that answered the prompts.
`dot_omp/private_agent/private_config.yml` and `mcp.json.tmpl` are applied as
`~/.omp/agent/config.yml` and `~/.omp/agent/mcp.json` while staying private to chezmoi.
