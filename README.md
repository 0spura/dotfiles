# dotfiles

Dotfiles pessoais gerenciados com [chezmoi](https://chezmoi.io). Suporte a Fedora, macOS e Windows.

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

O bootstrap instala os pacotes declarados em `.chezmoidata/packages.yaml` e aplica todos os configs automaticamente.

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

Editar `.chezmoidata/packages.yaml` e rodar `chezmoi apply`. O script detecta a mudança e instala o que estiver faltando.

Pacotes com instalação via gerenciador de pacotes (`dnf`, `brew`, `winget`) ficam nas listas por OS. Pacotes com instalação customizada (curl, script, etc.) ficam em `custom`:

```yaml
packages:
  linux:
    dnf:
      - gh
    custom:
      - name: zed
        check: "which zed"
        install: "curl -f https://zed.rs/install.sh | sh"
```
