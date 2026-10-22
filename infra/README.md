# OpenTofu: plano Cloudflare do homelab.
#
# Uso: não executar `tofu plan`/`apply` sem `-target` enquanto o state estiver
# parcial; isso pode tentar criar recursos que já existem. Complete a importação
# antes de voltar ao fluxo normal. Nunca versionar o state nem imprimir segredos.
#
# Estrutura: `cloudflare.tf` declara DNS, Tunnel, Access e Gateway.
# hosts/ adiciona 1 host por ficheiro via modules/host.
# State local (`infra/terraform.tfstate`, ignorado pelo git, modo 0600) está
# parcial: state Cloudflare incompleto; não usar plan/apply global até importar
# todos os recursos existentes. OMP Web foi restaurado com apply direcionado em 2026-10-21.
# Próximo: completar importação e migrar para backend R2 — state contém dados sensíveis.

## TLS e HSTS

`cloudflare_zone_setting.min_tls_version` exige TLS 1.2 para toda a zona;
`security_header` ativa HSTS por 180 dias sem `includeSubdomains` nem preload.
Isso cobre `ssh.blima.dev` e `ai-memory.blima.dev` na borda HTTPS; não altera o
protocolo SSH encaminhado pelo Tunnel.

O registro DMARC iCloud está em `_dmarc.blima.dev` com `p=quarantine` e relatório
agregado enviado ao endereço de relatórios do Cloudflare. A política envia para
spam mensagens que falham DMARC; verificar SPF/DKIM alinhados para cada remetente
antes de adicionar outros serviços de envio.

Bot Fight Mode permanece desligado porque protege o domínio inteiro e pode
desafiar clientes API/móveis; `ai-memory.blima.dev` é um endpoint de API/MCP.
Turnstile não foi criado sem uma aplicação/formulário que o valide.
`security.txt` exige um contato de segurança público real; não publiquei endereço
pessoal inventado. AI Labyrinth é um recurso controlado no painel e não foi
ativado sem API suportada confirmada.

## Sessão do SSH

`cloudflare.tf` define `mac ssh` (`ssh.blima.dev`) com `session_duration = "720h"`
(30 dias). Isso controla a janela de autenticação para novas conexões, não a
duração de uma conexão SSH aberta. O Cloudflare Access permite no máximo um mês.

Para ajustar no dashboard: **Zero Trust → Access controls → Applications →
mac ssh → Configure → Overview → Session Duration → 1 month → Save**.
Na política **owner only**, deixe **Session Duration** como **Same as application
session timeout** para não substituir o prazo do aplicativo.

## OMP Web

`omp-web.blima.dev` passa pelo Tunnel para `http://127.0.0.1:30141`. O
container publica somente em loopback e não usa autenticação própria; Cloudflare
Access aplica a política `owner only` para o email configurado, com sessão de
30 dias.

O container inclui o Docker CLI oficial e o plugin `docker compose`, e monta o
socket do OrbStack em `/var/run/docker.sock`. Isso permite aos agentes controlar
o daemon inteiro: outros containers, imagens, redes e volumes; não há isolamento
por projeto.
O socket aparece como `root:root` dentro do container no OrbStack; `group_add: ["0"]`
permite acesso como grupo suplementar sem executar o OMP como root. Isso continua
concedendo controle total do daemon. Cloudflare Access protege o tráfego remoto,
mas processos locais podem acessar a porta loopback diretamente.

O container usa a revisão fixa do OMP Web e preserva as sessões/configuração
em `~/.omp/agent`. Monta as skills do host como somente leitura e apenas o
diretório de projeto definido por `OMP_WEB_WORKSPACES_ROOT` no `.env` local,
mantido fora do repositório. O volume `cargo-home` mantém as dependências Rust.

`gh` não herda a autenticação do host (no macOS, normalmente mantida no
Keychain). A configuração do GitHub CLI e do helper Git fica no volume Docker
`gh-config`, separado das credenciais do host. Para autenticar interativamente:

```sh
docker exec -it omp-web-omp-web-1 gh auth login --hostname github.com --git-protocol https --web
docker exec -it omp-web-omp-web-1 gh auth setup-git
```

No container não há keychain do macOS; o `gh` pode armazenar o token no volume
`gh-config` em formato legível. Os agentes com acesso ao OMP podem usar essa
credencial. Revogue-a com `gh auth logout --hostname github.com` no container.
