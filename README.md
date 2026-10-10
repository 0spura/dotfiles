# dotfiles

[chezmoi](https://www.chezmoi.io/) source tree for agent config, skills, and the per-machine
software bootstrap, applied on Fedora, macOS, and Windows. Nothing is live until `chezmoi apply`.

## What it manages

| Target | Content |
| --- | --- |
| `~/.agents/skills/` | The skill tree, deployed on every machine |
| `~/.omp/agent/` | OMP agents, rules, and per-machine config (`private_`, never in diffs) |
| `~/.ssh/config` | `*.blima.dev` client via `cloudflared access ssh` (no IPs, works off-LAN) |
| Per machine | Development tools, languages, containers, plus optional ai-memory and OMP |
| Fedora/macOS | `workctl` through Cargo; `gh`/`glab` authenticated separately |

## Machine flags

Two prompts decide what a machine gets (`~/.config/chezmoi/chezmoi.toml`):

| Flag | Values | Effect |
| --- | --- | --- |
| `machine` | `mac-mini`, `dell-personal`, `other` | Identity; `mac-mini` is the homelab server behind the Cloudflare SSH tunnel |
| `profiles` | `dev`, `homelab-server`, `ai-memory-server` | `homelab-server` installs `cloudflared` and registers the tunnel daemon; the SSH helper goes everywhere |

Scripts live under `.chezmoiscripts/`, by phase then owner:

```text
10-platform/    fedora/  macos/  windows/
20-components/  run_after_30-ai-memory  40-omp  50-workctl  60-stacks
30-homelab/     run_after_10-cloudflared (everywhere)  20-tunnel-register (server only)
```

Numbers keep platform setup ahead of components; components are visible by name.

## First run on a new machine

```sh
git clone https://github.com/0spura/dotfiles ~/Projects/dotfiles
cd ~/Projects/dotfiles
chezmoi init --source "$PWD"   # answers the prompts, writes ~/.config/chezmoi/chezmoi.toml
chezmoi diff                   # preview, then apply
chezmoi apply
```

After that only `chezmoi apply` is needed; run `chezmoi diff` first after `git pull`.

```sh
chezmoi apply --dry-run --verbose   # render everything, run no script
chezmoi status                      # files differing from the applied state
chezmoi ignored                     # repository-only paths kept out of $HOME
```

Install scripts run on every apply and are idempotent: platform setup installs only what is
missing; OMP and workctl check upstream and never let a failed update remove a working install.

## Requirements

- chezmoi v2 (verified with v2.70.4).
- Fedora: scripts use `sudo`; the first apply that installs Docker CE needs a re-login for the group.
- macOS: Homebrew preinstalled; the scripts add OrbStack, `node@24`, `openjdk@21`, `rust`, `python`,
  `gh`, and never upgrade what exists.
- Windows: only Docker Desktop runs; the script prints the missing WSL 2 step and stops there.

## workctl

Installed and updated through Cargo on Fedora/macOS (manual on Windows):

```sh
cargo install --git https://github.com/0spura/workctl --locked
```

Cargo owns the checkout, cache, and binary; the Zsh profile puts
`${CARGO_INSTALL_ROOT:-${CARGO_HOME:-$HOME/.cargo}}/bin` on `PATH`, and the bootstrap pins that
root so install and discovery agree. Providers come from repository configuration; the `plan`,
`implementation`, and `pull-request` skills use workctl `--help` for the grammar.

## Mac mini services

- **Ollama for ai-memory**: native Homebrew service serving `embeddinggemma-2:270m` on loopback
  `host.docker.internal:11434`. Manage with `brew services start|stop|restart ollama`, inspect with
  `ollama ps`, logs at `/opt/homebrew/var/log/ollama.log`; never run the GUI app alongside it.
  Keep port 11434 off the LAN; recreate the ai-memory container after changing embeddings.
- **Peripheral USB control**: `com.luis.monitor-usb` runs `~/.local/bin/monitor-usb.py` and cycles
  power on hub front port 2 (Apple hubs `2-1`/`2-2`) when the monitor sleeps; rear ports and port 1
  are untouched, but never attach storage to the controlled hub. Logs in
  `~/Library/Logs/monitor-usb{,.error}.log`; stop/restore with
  `launchctl bootout gui/$(id -u)/com.luis.monitor-usb`.

## Secrets

Nothing secret is committed. Provider keys and the ai-memory token live only in the machine's
`~/.config/chezmoi/chezmoi.toml`; `private_config.yml` and `mcp.json.tmpl` are applied to
`~/.omp/agent/` while staying private to chezmoi.
