# Chezmoi Migration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Migrar o repo de dotfiles para chezmoi, com estrutura idiomática, gerenciamento declarativo de pacotes e suporte a Fedora, macOS e Windows.

**Architecture:** O repo torna-se o source directory do chezmoi. Arquivos são renomeados com convenções `dot_`. Pacotes são declarados em `.chezmoidata/packages.yaml` e instalados via scripts `run_onchange_` por OS. Bootstrap em nova máquina é um único comando.

**Tech Stack:** chezmoi, Go templates (built-in ao chezmoi), bash (Linux/macOS), PowerShell (Windows), YAML

---

## Mapa de arquivos

| Ação      | Arquivo                                          | Responsabilidade                            |
|-----------|--------------------------------------------------|---------------------------------------------|
| Renomear  | `.claude/` → `dot_claude/`                       | Configs do Claude Code → `~/.claude/`       |
| Renomear  | `.codex/` → `dot_codex/`                        | Configs do Codex → `~/.codex/`              |
| Renomear  | `.config/` → `dot_config/`                      | XDG configs → `~/.config/`                  |
| Criar     | `.chezmoi.toml.tmpl`                             | Config do chezmoi com dados por OS          |
| Criar     | `.chezmoiignore`                                 | Exclui arquivos do OS errado                |
| Criar     | `.chezmoidata/packages.yaml`                     | Lista declarativa de pacotes por OS         |
| Criar     | `run_onchange_install-packages.sh.tmpl`          | Instala pacotes no Linux/macOS              |
| Criar     | `run_onchange_install-packages.ps1.tmpl`         | Instala pacotes no Windows                  |
| Ignorar   | `gentoo/`                                        | Config de sistema (fora do escopo do chezmoi — manter no repo mas não gerenciado pelo chezmoi) |

> **Nota sobre `.claude/settings.local.json`:** este arquivo é gerado localmente e não deve ser aplicado por chezmoi em outras máquinas. Será excluído via `.chezmoiignore`.

---

## Task 1: Instalar chezmoi

**Files:**
- Nenhum arquivo do repo modificado

- [ ] **Step 1: Instalar chezmoi via script oficial**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

- [ ] **Step 2: Verificar instalação**

```bash
chezmoi --version
```

Esperado: `chezmoi version vX.Y.Z, ...`

- [ ] **Step 3: Commit** (nada a commitar — instalação local)

---

## Task 2: Renomear diretórios para convenção chezmoi

**Files:**
- Renomear: `.claude/` → `dot_claude/`
- Renomear: `.codex/` → `dot_codex/`
- Renomear: `.config/` → `dot_config/`

chezmoi mapeia `dot_X` → `.X` no home directory. Isso é obrigatório para que `chezmoi apply` saiba onde colocar cada arquivo.

- [ ] **Step 1: Renomear via git mv**

```bash
git mv .claude dot_claude
git mv .codex dot_codex
git mv .config dot_config
```

- [ ] **Step 2: Verificar estrutura resultante**

```bash
find . -not -path './.git/*' -not -path './docs/*' -not -path './gentoo/*' | sort
```

Esperado:
```
.
./dot_claude
./dot_claude/CLAUDE.md
./dot_claude/settings.json
./dot_claude/settings.local.json
./dot_codex
./dot_codex/config.toml
./dot_config
./dot_config/zed
./dot_config/zed/settings.json
```

- [ ] **Step 3: Commit**

```bash
git commit -m "chore: rename dirs to chezmoi dot_ convention"
```

---

## Task 3: Criar `.chezmoi.toml.tmpl`

**Files:**
- Criar: `.chezmoi.toml.tmpl`

Config do chezmoi. O sufixo `.tmpl` faz com que seja processado como Go template na primeira inicialização, permitindo dados por OS no futuro. Por ora, contém apenas os dados pessoais.

- [ ] **Step 1: Criar o arquivo**

Conteúdo de `.chezmoi.toml.tmpl`:

```toml
[data]
  name = "Luis Lima"
  email = "luisflima2020@gmail.com"
```

- [ ] **Step 2: Verificar que é válido**

```bash
cat .chezmoi.toml.tmpl
```

- [ ] **Step 3: Commit**

```bash
git add .chezmoi.toml.tmpl
git commit -m "feat: add chezmoi config template"
```

---

## Task 4: Criar `.chezmoiignore`

**Files:**
- Criar: `.chezmoiignore`

Exclui arquivos que não devem ser gerenciados pelo chezmoi:
- Scripts do OS errado (evita tentar aplicar `.ps1` no Linux)
- `settings.local.json` do Claude (gerado localmente, máquina-específico)
- Diretório `gentoo/` (config de sistema, não home directory)
- Diretório `docs/` (documentação do repo, não um dotfile)

- [ ] **Step 1: Criar o arquivo**

Conteúdo de `.chezmoiignore`:

```
# Docs e configs do repo — não são dotfiles
docs
gentoo

# Script do OS errado
{{ if ne .chezmoi.os "windows" }}
run_onchange_install-packages.ps1.tmpl
{{ end }}
{{ if eq .chezmoi.os "windows" }}
run_onchange_install-packages.sh.tmpl
{{ end }}

# Settings local gerado automaticamente — específico da máquina
dot_claude/settings.local.json
```

- [ ] **Step 2: Commit**

```bash
git add .chezmoiignore
git commit -m "feat: add chezmoiignore"
```

---

## Task 5: Criar `.chezmoidata/packages.yaml`

**Files:**
- Criar: `.chezmoidata/packages.yaml`

O chezmoi injeta automaticamente todo o conteúdo de `.chezmoidata/` como variáveis de template. `packages.yaml` torna-se acessível como `{{ .packages }}` nos scripts. Inicializado com os pacotes atuais de uso (zed, gh, fzf).

- [ ] **Step 1: Criar diretório e arquivo**

```bash
mkdir -p .chezmoidata
```

Conteúdo de `.chezmoidata/packages.yaml`:

```yaml
linux:
  dnf:
    - zed
    - gh
    - fzf

darwin:
  brew:
    - zed
    - gh
    - fzf

windows:
  winget:
    - Zed.Zed
    - GitHub.cli
    - junegunn.fzf
```

- [ ] **Step 2: Verificar YAML válido**

```bash
python3 -c "import yaml; yaml.safe_load(open('.chezmoidata/packages.yaml'))" && echo "OK"
```

Esperado: `OK`

- [ ] **Step 3: Commit**

```bash
git add .chezmoidata/
git commit -m "feat: add declarative package list"
```

---

## Task 6: Criar script de instalação Linux/macOS

**Files:**
- Criar: `run_onchange_install-packages.sh.tmpl`

`run_onchange_` faz o script rodar sempre que o conteúdo renderizado mudar (ou seja: sempre que `packages.yaml` tiver um pacote novo). O sufixo `.tmpl` permite que chezmoi injete `{{ .packages }}` antes de executar. A checagem `rpm -q` / `brew list` antes de instalar garante idempotência.

- [ ] **Step 1: Criar o arquivo**

Conteúdo de `run_onchange_install-packages.sh.tmpl`:

```bash
{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh
set -e

{{ range .packages.linux.dnf -}}
if ! rpm -q {{ . }} > /dev/null 2>&1; then
  echo "Instalando {{ . }}..."
  sudo dnf install -y {{ . }}
fi
{{ end -}}

{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh
set -e

{{ range .packages.darwin.brew -}}
if ! brew list {{ . }} > /dev/null 2>&1; then
  echo "Instalando {{ . }}..."
  brew install {{ . }}
fi
{{ end -}}

{{ end -}}
```

- [ ] **Step 2: Commit**

```bash
git add run_onchange_install-packages.sh.tmpl
git commit -m "feat: add Linux/macOS package install script"
```

---

## Task 7: Criar script de instalação Windows

**Files:**
- Criar: `run_onchange_install-packages.ps1.tmpl`

Equivalente ao script anterior para Windows. O bloco `{{ if eq .chezmoi.os "windows" }}` faz o chezmoi ignorar o arquivo nos outros OSes (complementando o `.chezmoiignore`). `winget list --id --exact` verifica se o pacote já está instalado antes de tentar instalar.

- [ ] **Step 1: Criar o arquivo**

Conteúdo de `run_onchange_install-packages.ps1.tmpl`:

```powershell
{{ if eq .chezmoi.os "windows" -}}
$packages = @(
{{ range .packages.windows.winget -}}
  "{{ . }}"
{{ end -}}
)

foreach ($pkg in $packages) {
  $installed = winget list --id $pkg --exact 2>$null
  if ($LASTEXITCODE -ne 0) {
    Write-Host "Instalando $pkg..."
    winget install --id $pkg --exact --silent
  }
}
{{ end -}}
```

- [ ] **Step 2: Commit**

```bash
git add run_onchange_install-packages.ps1.tmpl
git commit -m "feat: add Windows package install script"
```

---

## Task 8: Inicializar chezmoi apontando para o repo local

**Files:**
- Nenhum arquivo do repo modificado

Esta task configura o chezmoi na máquina local para usar este repo como source directory, sem precisar de push para o GitHub ainda.

- [ ] **Step 1: Inicializar chezmoi com source directory local**

```bash
chezmoi init --source /home/luislima/Projects/personal/dotfiles
```

- [ ] **Step 2: Verificar que o chezmoi reconhece o source**

```bash
chezmoi source-path
```

Esperado: `/home/luislima/Projects/personal/dotfiles`

- [ ] **Step 3: Verificar dados de template disponíveis**

```bash
chezmoi data
```

Esperado: JSON com `.chezmoi.os = "linux"`, `.chezmoi.osRelease.id = "fedora"`, e `.packages` com a lista do `packages.yaml`.

---

## Task 9: Testar com dry-run

**Files:**
- Nenhum arquivo modificado

- [ ] **Step 1: Ver o diff antes de aplicar**

```bash
chezmoi diff
```

Esperado: chezmoi mostra que vai criar/atualizar `~/.claude/settings.json`, `~/.config/zed/settings.json`, `~/.codex/config.toml`. Não deve mostrar `gentoo/`, `docs/`, nem `settings.local.json`.

- [ ] **Step 2: Verificar que o template do script renderiza corretamente**

```bash
chezmoi execute-template < run_onchange_install-packages.sh.tmpl
```

Esperado: script bash com os pacotes da seção `linux.dnf` do `packages.yaml` interpolados. Não deve conter sintaxe Go template (`{{`) no output.

---

## Task 10: Aplicar e verificar

**Files:**
- Target: `~/.claude/settings.json`, `~/.config/zed/settings.json`, `~/.codex/config.toml`

- [ ] **Step 1: Aplicar**

```bash
chezmoi apply
```

Esperado: chezmoi aplica os arquivos sem erros. O script `run_onchange_install-packages.sh` roda e instala pacotes faltantes via `dnf`.

- [ ] **Step 2: Verificar arquivos nos destinos**

```bash
ls ~/.claude/ ~/.codex/ ~/.config/zed/
```

Esperado: os arquivos existem com conteúdo correto.

- [ ] **Step 3: Verificar que `chezmoi diff` não mostra mais nada**

```bash
chezmoi diff
```

Esperado: sem output (tudo já aplicado, nada diverge).

---

## Task 11: Push e README

**Files:**
- Criar: `README.md`

- [ ] **Step 1: Criar README com instrução de bootstrap**

Conteúdo de `README.md`:

```markdown
# dotfiles

Dotfiles pessoais gerenciados com [chezmoi](https://chezmoi.io).

## Bootstrap — nova máquina

**Linux/macOS:**
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply github.com/luislima/dotfiles
```

**Windows (PowerShell):**
```powershell
irm -useb https://get.chezmoi.io/ps1 | powershell -c -
chezmoi init --apply github.com/luislima/dotfiles
```

## Uso diário

```sh
# Adicionar nova config
chezmoi add ~/.config/nova-ferramenta/config.json

# Editar config pelo source
chezmoi edit ~/.config/zed/settings.json

# Ver diff antes de aplicar
chezmoi diff

# Aplicar mudanças
chezmoi apply

# Sincronizar
chezmoi git -- add -A && chezmoi git -- commit -m "feat: ..." && chezmoi git -- push
```

## Adicionar pacote

Editar `.chezmoidata/packages.yaml` e rodar `chezmoi apply`.
```

- [ ] **Step 2: Commit e push**

```bash
git add README.md
git commit -m "docs: add README with bootstrap instructions"
git push
```
