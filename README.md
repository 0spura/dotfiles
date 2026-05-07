# dotfiles

Dotfiles pessoais gerenciados com [chezmoi](https://chezmoi.io). Suporte a Fedora, macOS e Windows.

## Pré-requisitos

**Windows:** liberar execução de scripts no PowerShell (necessário para o chezmoi rodar os scripts):
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

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

O bootstrap instala os pacotes declarados em `.chezmoidata/packages/` e aplica todos os configs automaticamente.

## Uso diário

```sh
# Adicionar nova config
chezmoi add ~/.config/nova-ferramenta/config.json

# Editar config pelo source
chezmoi edit ~/.config/zed/settings.json

# Ver o que vai mudar antes de aplicar
chezmoi diff

# Aplicar mudanças
chezmoi apply

# Sincronizar com o repo
chezmoi git -- add -A
chezmoi git -- commit -m "feat: ..."
chezmoi git -- push
```

## Adicionar ou remover pacotes

Editar os arquivos em `.chezmoidata/packages/` e rodar `chezmoi apply`. O script detecta a mudança e instala o que estiver faltando.

Pacotes com instalação via gerenciador de pacotes (`dnf`, `brew`, `winget`) ficam nas listas por OS. Pacotes com instalação customizada (curl, script, etc.) ficam em `custom`:

```yaml
# .chezmoidata/packages/linux.yaml
packages:
  linux:
    dnf_install:
      - gh
    custom:
      - name: zed
        check: "which zed"
        install: "curl -f https://zed.rs/install.sh | sh"
```

## Tweaks do sistema

Editar os arquivos em `.chezmoidata/tweaks/` e rodar `chezmoi apply`. Os scripts `run_onchange_apply-tweaks.*.tmpl` aplicam os ajustes quando o conteúdo renderizado muda.

Use o tipo declarativo de cada plataforma quando possível:

```yaml
tweaks:
  linux:
    gsettings: []
  darwin:
    defaults: []
  windows:
    registry: []
```

Para ajustes que precisam de lógica própria, use `commands` no Linux/macOS ou `powershell` no Windows.
