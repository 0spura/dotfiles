# Dotfiles com chezmoi — Design Spec

**Data:** 2026-05-06  
**Status:** aprovado

---

## Contexto

Repo centralizado de dotfiles para uso em Fedora, macOS e Windows. O objetivo é:

1. Aplicar configs automaticamente nos destinos corretos em qualquer OS
2. Gerenciar pacotes de forma declarativa, com controle granular sobre o que instalar
3. Fazer tudo de forma idiomática ao chezmoi, sem reinventar mecanismos que a ferramenta já provê

---

## Ferramenta escolhida: chezmoi

chezmoi gerencia dotfiles aplicando arquivos diretamente nos destinos (não via symlinks), o que funciona corretamente nos três OSes — especialmente no Windows, onde symlinks exigem privilégio admin ou modo developer.

O repo **é** o source directory do chezmoi (`~/.local/share/chezmoi`). Em uma nova máquina, `chezmoi init --apply` clona o repo e aplica tudo num único comando.

---

## Estrutura do source directory

```
dotfiles/
├── .chezmoi.toml.tmpl                          # config do chezmoi gerada por template
├── .chezmoiignore                               # exclusões por OS
│
├── .chezmoidata/
│   └── packages.yaml                           # lista declarativa de pacotes por OS
│
├── run_onchange_install-packages.sh.tmpl        # instala pacotes no Linux/macOS
├── run_onchange_install-packages.ps1.tmpl       # instala pacotes no Windows
│
├── dot_config/
│   └── zed/
│       └── settings.json                       # → ~/.config/zed/settings.json
│
├── dot_claude/
│   └── settings.json                           # → ~/.claude/settings.json
│
└── dot_codex/
    └── config.toml                             # → ~/.codex/config.toml
```

### Convenções de nomenclatura do chezmoi

| Prefixo no source     | Resultado no target          |
|-----------------------|------------------------------|
| `dot_`                | `.` (ex: `dot_config/` → `.config/`) |
| `executable_`         | arquivo com bit executável   |
| `private_`            | permissões sem group/world   |
| `readonly_`           | sem permissão de escrita     |
| `create_`             | só cria se não existir       |
| `run_onchange_`       | script executado quando conteúdo muda |
| `.tmpl`               | processado como Go template  |

---

## Gerenciamento de pacotes

### Fonte de dados: `.chezmoidata/packages.yaml`

O chezmoi injeta automaticamente o conteúdo de `.chezmoidata/` como variáveis de template (ex: `{{ .packages }}`). Não é necessário parsing manual.

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

Para adicionar ou remover um pacote: editar o `packages.yaml` e rodar `chezmoi apply`. O script detecta a mudança (via SHA256 do conteúdo) e instala o delta.

### Script Linux/macOS: `run_onchange_install-packages.sh.tmpl`

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

### Script Windows: `run_onchange_install-packages.ps1.tmpl`

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

**Por que `run_onchange_` e não `run_once_`:**  
`run_once_` roda uma única vez na vida da máquina. `run_onchange_` roda toda vez que o conteúdo do script (incluindo o `packages.yaml` renderizado no template) muda — que é o comportamento correto: adicionar um pacote na lista dispara a instalação na próxima aplicação.

---

## Diferenças entre OSes

### `.chezmoiignore`

Exclui arquivos do OS errado da aplicação:

```
{{ if ne .chezmoi.os "windows" }}
run_onchange_install-packages.ps1.tmpl
{{ end }}
{{ if eq .chezmoi.os "windows" }}
run_onchange_install-packages.sh.tmpl
{{ end }}
```

### `.chezmoi.toml.tmpl`

Config gerada por template para defaults por OS:

```toml
[data]
  name = "Luis Lima"
  email = "luisflima2020@gmail.com"
```

---

## Bootstrap — nova máquina

### Linux/macOS

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply github.com/luislima/dotfiles
```

### Windows (PowerShell)

```powershell
irm -useb https://get.chezmoi.io/ps1 | powershell -c -
chezmoi init --apply github.com/luislima/dotfiles
```

O `chezmoi init --apply`:
1. Clona o repo em `~/.local/share/chezmoi`
2. Executa os `run_onchange_` scripts (instala pacotes)
3. Aplica os arquivos de config nos destinos corretos

---

## Fluxo de uso diário

```
# Adicionar nova config ao chezmoi
chezmoi add ~/.config/nova-ferramenta/config.json

# Editar uma config pelo source
chezmoi edit ~/.config/zed/settings.json

# Ver diff antes de aplicar
chezmoi diff

# Aplicar mudanças
chezmoi apply

# Sincronizar repo
chezmoi git -- add -A && chezmoi git -- commit -m "feat: add nova-ferramenta"
chezmoi git -- push
```

---

## O que o chezmoi entrega nativamente (sem código customizado)

| Necessidade                          | Como o chezmoi resolve          |
|--------------------------------------|---------------------------------|
| Aplicar configs no destino certo     | `chezmoi apply` (nativo)        |
| Diferenças por OS                    | Templates com `.chezmoi.os`     |
| Diferenças por distro Linux          | `.chezmoi.osRelease.id`         |
| Não aplicar arquivo no OS errado     | `.chezmoiignore` com templates  |
| Instalar pacotes quando lista muda   | `run_onchange_` + `.chezmoidata`|
| Dry-run antes de aplicar             | `chezmoi diff` (nativo)         |
| Bootstrap em nova máquina            | `chezmoi init --apply` (nativo) |
| Sincronização via git                | `chezmoi git` (nativo)          |

---

## Fora de escopo

- Configuração de sistema (além de dotfiles) — fora do escopo do chezmoi por design
- Secrets/credenciais — chezmoi suporta nativamente (1Password, Bitwarden etc.), mas não é necessidade atual
- Fedora-específico vs genérico Linux — pode ser adicionado via `.chezmoi.osRelease.id` quando necessário
