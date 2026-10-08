# dotfiles

A [chezmoi](https://www.chezmoi.io/) source tree: agent configuration, skills, and the per-machine
software bootstrap, applied locally on Fedora, macOS, and Windows. Every machine clones this
repository and runs `chezmoi` from the clone; nothing here is live until `chezmoi apply`.

## What it manages

| Target | Content |
| --- | --- |
| `~/.agents/skills/` | The canonical skill tree, deployed on every machine |
| `~/.omp/agent/` | OMP agent definitions, rules, and the per-machine config (written `private_`, so it never appears in diffs) |
| `~/.ssh/config` | Client for `*.blima.dev` via `cloudflared access ssh` (no IPs, works off-LAN) |
| Fedora, macOS, Windows | Missing development tools, languages, and containers, plus optional ai-memory and OMP |

## Machine flags

Two prompts decide what a machine gets (`~/.config/chezmoi/chezmoi.toml`):

| Flag | Values | Effect |
| --- | --- | --- |
| `machine` | `mac-mini` (homelab server), `dell-personal`, `other` | Identity; the server publishes SSH via Cloudflare tunnel |
| `profiles` | `dev`, `homelab-server`, `ai-memory-server` | `homelab-server` installs `cloudflared` + registers the tunnel daemon (server only); `cloudflared` as SSH helper goes on every machine |

`cloudflared` has two roles: on a client it only runs during `ssh` as the
`ProxyCommand` helper (no daemon, no token); on the server it also runs the
tunnel daemon. `.chezmoiscripts/30-homelab/` splits this:
`run_after_10-cloudflared.sh.tmpl` (everywhere) vs
`run_after_20-tunnel-register.sh.tmpl` (gated on `homelab-server`).

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
```

ChezMoi executes `run_` scripts in these nested directories without deploying them.
The numbered phase prefixes keep platform setup ahead of optional component setup;
platform scripts stay grouped by OS, while each component script is directly visible.

### Local embeddings on the Mac mini

On macOS with `machine = "mac-mini"`, the package script installs the native
Ollama formula, starts its user service with `brew services`, and downloads
`embeddinggemma-2:270m` only when it is missing. The service starts at user login,
continues while the screen is locked, and uses the Apple GPU rather than a Linux
container's CPU backend.

The ai-memory container uses `openai-compat` embeddings at
`http://host.docker.internal:11434/v1`, with 768 dimensions and the model's
separate search/document prefixes. This Mac mini configuration overrides the
embedding-provider prompts; other machines retain their selected provider.
Ollama keeps its default loopback bind. This host connection is verified with
OrbStack; do not expose port 11434 to the LAN just to connect the container.

Manage the server with `brew services start|stop|restart ollama`, inspect loaded
models with `ollama ps`, and read the service log at
`/opt/homebrew/var/log/ollama.log`. Do not run the GUI application alongside the
Homebrew service. An existing container must be recreated with the new embedding
environment before changing providers; preserve its volume and credentials,
back up first, and run `ai-memory embed` for each workspace/project afterward.


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


## Monitor-controlled peripheral USB (Mac mini M4)

`Library/LaunchAgents/com.luis.monitor-usb.plist.tmpl` deploys the user service
`com.luis.monitor-usb`, running `~/.local/bin/monitor-usb.py` at login.
Requires Homebrew Python, `uhubctl`, and BetterDisplay with CLI integration enabled.

The service polls ASUS VG279Q1A DDC VCP `0xD6` every two seconds. Ten seconds of
`Failed.` responses from a responsive BetterDisplay app cuts only front port 2
on Apple hubs `2-1` and `2-2` (USB2/USB3). Port 1 and rear ports are untouched.
A value of `1` restores power. Unknown responses restore/keep power on.
Persistent DDC failures can still cause an unintended cutoff; do not attach
storage to the controlled peripheral hub.

Logs: `~/Library/Logs/monitor-usb.log` and `monitor-usb.error.log`.
To stop and restore power: `launchctl bootout gui/$(id -u)/com.luis.monitor-usb`.
To start: `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.luis.monitor-usb.plist`.

## Secrets

Nothing secret is committed. Provider API keys and the ai-memory auth token live only in
`~/.config/chezmoi/chezmoi.toml` on the machine that answered the prompts.
`dot_omp/private_agent/private_config.yml` and `mcp.json.tmpl` are applied as
`~/.omp/agent/config.yml` and `~/.omp/agent/mcp.json` while staying private to chezmoi.
