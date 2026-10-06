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
