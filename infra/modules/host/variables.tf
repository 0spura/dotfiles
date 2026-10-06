# Contrato de 1 host: túnel + ingress + DNS + Access app.
# Host novo = 1 ficheiro em hosts/ chamando este módulo. Nada aqui
# referencia IP; o túnel disca de dentro para fora.

variable "name" {
  type        = string
  description = "Nome curto do host (ex. mac). Vira ssh.<name>.blima.dev."
}

variable "ssh_user" {
  type        = string
  description = "User Unix para SSH neste host."
}

variable "account_id" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "owner_email" {
  type = string
}

variable "services" {
  type = list(object({
    subdomain = string # ex. "ssh.mac" -> ssh.mac.blima.dev
    port      = number # porta local no host
    proto     = string # "ssh" ou "http"
    access    = string # "owner" (allow email) ou "public" (bypass)
  }))
  description = "Serviços deste host. SSH entries viram ingress ssh://localhost."
}
