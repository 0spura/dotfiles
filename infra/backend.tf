# Homelab Cloudflare: estado declarativo (OpenTofu).
#
# Invariante: nenhum .tf contém IP literal. Hosts entram por nome via
# modules/host; o túnel disca de dentro para fora, então DHCP pode mudar.
#
# Segredos (nunca no git): CLOUDFLARE_API_TOKEN como env no apply.
# Estado: backend local por enquanto; migrar para R2 antes de multi-máquina.

terraform {
  required_version = ">= 1.10"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
