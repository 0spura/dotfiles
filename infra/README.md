# OpenTofu: plano Cloudflare do homelab.
#
# Uso: não executar `tofu plan`/`apply` sem `-target` enquanto o state estiver
# parcial; isso pode tentar criar recursos que já existem. Complete a importação
# antes de voltar ao fluxo normal. Nunca versionar o state nem imprimir segredos.
#
# Estrutura: `cloudflare.tf` declara DNS, Tunnel, Access e Gateway.
# hosts/ adiciona 1 host por ficheiro via modules/host.
# State local (`infra/terraform.tfstate`, ignorado pelo git, modo 0600) está
# parcial: túnel/configuração existente e recursos omp-web foram importados/aplicados.
# Os demais recursos existentes ainda não foram importados: NÃO usar plan/apply global
# até reconciliar o state. Alvos específicos só em recuperação revisada.
# Próximo: completar a importação e migrar para backend R2 — state contém dados sensíveis.

## Sessão do SSH

`cloudflare.tf` define `mac ssh` (`ssh.blima.dev`) com `session_duration = "720h"`
(30 dias). Isso controla a janela de autenticação para novas conexões, não a
duração de uma conexão SSH aberta. O Cloudflare Access permite no máximo um mês.

Para ajustar no dashboard: **Zero Trust → Access controls → Applications →
mac ssh → Configure → Overview → Session Duration → 1 month → Save**.
Na política **owner only**, deixe **Session Duration** como **Same as application
session timeout** para não substituir o prazo do aplicativo.
