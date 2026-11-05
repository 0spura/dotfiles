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
Turnstile não foi criado sem uma aplicação/formulário que o valide. `security.txt`
exige um contato de segurança público real; não publiquei endereço pessoal
inventado. AI Labyrinth é um recurso controlado no painel e não foi ativado sem
API suportada confirmada.

## Sessão do SSH

`cloudflare.tf` define `mac ssh` (`ssh.blima.dev`) com `session_duration = "720h"`
(30 dias). Isso controla a janela de autenticação para novas conexões, não a
duração de uma conexão SSH aberta. O Cloudflare Access permite no máximo um mês.

Para ajustar no dashboard: **Zero Trust → Access controls → Applications →
mac ssh → Configure → Overview → Session Duration → 1 month → Save**.
Na política **owner only**, deixe **Session Duration** como **Same as application
session timeout** para não substituir o prazo do aplicativo.

## OMP Web

`omp-web.blima.dev` passa pelo Tunnel para `http://127.0.0.1:30141`; o host e a porta
permanecem inalterados na migração. Cloudflare Access mantém a política `owner only`
para o email configurado, com sessão de 30 dias. O listener local fica restrito a
loopback e não exige senha própria; processos locais podem acessá-lo.

O script de chezmoi instala `@kahme247/ompweb@0.6.0` via `npx`, usando Node.js 24+
e o `omp` encontrado no `PATH` (priorizando `~/.local/bin`). Ele registra o
LaunchAgent `com.kahme247.ompweb`, que inicia as sessões OMP pelo próprio CLI.
A atualização automática da interface fica desabilitada; a versão do pacote é
fixada no script.

O estado continua no host, sem migração: `~/.omp/agent` (bancos SQLite, sessões,
blobs e `mcp.json`) e `~/.agents/skills`. Não compartilhe bancos SQLite/WAL entre
macOS e a VM de containers; isso já causou corrupção. O checkout antigo em
`~/.local/share/omp-web` é mantido como rollback, mas não é mais iniciado.
