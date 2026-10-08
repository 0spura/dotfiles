# Estado importado 2026-10-06: espelha o que existe hoje no dashboard.
# Transitório /24 (rota + allow + split) sai na fase de endurecimento,
# quando cada serviço tiver hostname próprio via modules/host.

# --- DNS gerido (mail iCloud + hostnames de túnel) ---
# Mail (não mexer sem testar envio): MX/SPF/DKIM/DMARC do iCloud.
resource "cloudflare_dns_record" "mx_01" {
  zone_id  = var.zone_id
  name     = "blima.dev"
  type     = "MX"
  content  = "mx01.mail.icloud.com"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "mx_02" {
  zone_id  = var.zone_id
  name     = "blima.dev"
  type     = "MX"
  content  = "mx02.mail.icloud.com"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "spf" {
  zone_id = var.zone_id
  name    = "blima.dev"
  type    = "TXT"
  content = "\"v=spf1 include:icloud.com ~all\""
  ttl     = 1
}

resource "cloudflare_dns_record" "dkim" {
  zone_id = var.zone_id
  name    = "sig1._domainkey.blima.dev"
  type    = "CNAME"
  content = "sig1.dkim.blima.dev.at.icloudmailadmin.com"
  ttl     = 1
}

resource "cloudflare_dns_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc.blima.dev"
  type    = "TXT"
  content = "\"v=DMARC1; p=none; rua=mailto:f2fe0099913541069d7a6ac157512766@dmarc-reports.cloudflare.net\""
  ttl     = 1
}

resource "cloudflare_dns_record" "apple_verify" {
  zone_id = var.zone_id
  name    = "blima.dev"
  type    = "TXT"
  content = "\"apple-domain=PHI9bZRklQtzMkJg\""
  ttl     = 1
}

resource "cloudflare_dns_record" "ssh" {
  zone_id = var.zone_id
  name    = "ssh.blima.dev"
  type    = "CNAME"
  content = "8993801c-e6ca-4398-97a9-da4aa61717d9.cfargotunnel.com"
  comment = "ssh via cloudflared access"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "ai_memory" {
  zone_id = var.zone_id
  name    = "ai-memory.blima.dev"
  type    = "CNAME"
  content = "8993801c-e6ca-4398-97a9-da4aa61717d9.cfargotunnel.com"
  comment = "ai-memory server via cloudflared"
  proxied = true
  ttl     = 1
}

# --- Túnel mac-mini-m4 (criado pelo cloudflared no host) ---
resource "cloudflare_zero_trust_tunnel_cloudflared" "mac_mini_m4" {
  account_id = var.account_id
  name       = "mac-mini-m4"
  config_src = "cloudflare"

  lifecycle {
    ignore_changes = [
      connections,
      conns_active_at,
      status,
      tun_type,
      metadata,
      remote_config,
      created_at,
    ]
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "mac_mini_m4" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.mac_mini_m4.id

  config = {
    warp_routing = {
      enabled = true
    }
    ingress = [
      {
        hostname = "ssh.blima.dev"
        service  = "ssh://127.0.0.1:22"
      },
      {
        hostname = "ai-memory.blima.dev"
        service  = "http://127.0.0.1:49374"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

# --- Rota transitória /24 (sai no endurecimento) ---
resource "cloudflare_zero_trust_tunnel_cloudflared_route" "lan_full" {
  account_id = var.account_id
  network    = "192.168.0.0/24"
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.mac_mini_m4.id
  comment    = "lan-cheia-dhcp"
}

# --- Access apps (policies são recursos próprios no provider v5) ---
resource "cloudflare_zero_trust_access_application" "mac_ssh" {
  account_id                 = var.account_id
  name                       = "mac ssh"
  domain                     = "ssh.blima.dev"
  type                       = "self_hosted"
  app_launcher_visible       = false
  auto_redirect_to_identity  = false
  enable_binding_cookie      = false
  options_preflight_bypass   = false
  session_duration           = "720h"
  destinations = [{
    type = "public"
    uri  = "ssh.blima.dev"
  }]

  lifecycle {
    ignore_changes = [policies]
  }
}

resource "cloudflare_zero_trust_access_policy" "mac_ssh_owner" {
  account_id = var.account_id
  name       = "owner only"
  decision   = "allow"
  include = [{
    email = {
      email = var.owner_email
    }
  }]
}

resource "cloudflare_zero_trust_access_policy" "mac_ssh_token" {
  account_id = var.account_id
  name       = "service token cli"
  decision   = "non_identity"
  include = [{
    service_token = {
      token_id = "29954982-e23c-4de1-9d45-04f6e23859eb"
    }
  }]
}

resource "cloudflare_zero_trust_access_application" "ai_memory" {
  account_id                 = var.account_id
  name                       = "ai-memory server"
  domain                     = "ai-memory.blima.dev"
  type                       = "self_hosted"
  app_launcher_visible       = false
  auto_redirect_to_identity  = false
  enable_binding_cookie      = false
  options_preflight_bypass   = false
  session_duration           = "720h"

  destinations = [{
    type = "public"
    uri  = "ai-memory.blima.dev"
  }]



  lifecycle {
    ignore_changes = [policies]
  }
}

resource "cloudflare_zero_trust_access_policy" "ai_memory_owner" {
  account_id     = var.account_id
  name           = "owner only"
  decision       = "allow"
  include = [{
    email = {
      email = var.owner_email
    }
  }]
}

# --- Gateway: permite a /24 transitória; default-deny desligado ---
resource "cloudflare_zero_trust_gateway_policy" "allow_private_tunnel" {
  account_id  = var.account_id
  name        = "Allow private services (tunnel)"
  description = "Explicit allow so the default private-traffic deny never cuts the tunnel path"
  precedence  = 9001
  enabled     = true
  action      = "allow"
  filters     = ["l4"]
  traffic     = "net.dst.ip in {192.168.0.0/24}"
}

# --- SSH sem chave estatica: CA emite cert efemero por login Access ---
# O sshd do Mac confia via TrustedUserCAKeys (chezmoi, profile
# homelab-server). Principal do cert = prefixo do email (luisborgeslima),
# por isso o login passa a ser esse user (mapeado no sshd_config).
resource "cloudflare_zero_trust_access_short_lived_certificate" "mac_ssh" {
  account_id = var.account_id
  app_id     = cloudflare_zero_trust_access_application.mac_ssh.id
}
