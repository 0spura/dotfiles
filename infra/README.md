# OpenTofu: plano Cloudflare do homelab.
#
# Uso (nunca commitar segredo):
#   export TF_VAR_cloudflare_api_token="$(pass cloudflare/tofu)"
#   tofu -chdir=infra plan
#
# Estrutura: cloudflare.tf espelha o que existe (importado 2026-10-06);
# hosts/ adiciona 1 host por ficheiro via modules/host (plugável);
# modules/host é o contrato (túnel + ingress + DNS + Access).
# Transitório /24 (rota + allow + split) sai no endurecimento.
# Próximo: backend remoto (R2) antes de multi-máquina — estado tem segredo.

## Sessão do SSH

`cloudflare.tf` define `mac ssh` (`ssh.blima.dev`) com `session_duration = "720h"`
(30 dias). Isso controla a janela de autenticação para novas conexões, não a
duração de uma conexão SSH aberta. O Cloudflare Access permite no máximo um mês.

Para ajustar no dashboard: **Zero Trust → Access controls → Applications →
mac ssh → Configure → Overview → Session Duration → 1 month → Save**.
Na política **owner only**, deixe **Session Duration** como **Same as application
session timeout** para não substituir o prazo do aplicativo.
