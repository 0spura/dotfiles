# Um túnel remotely-managed por host. O cloudflared no host disca para
# fora com o token do túnel; nenhum IP do host aparece aqui.

resource "cloudflare_zero_trust_tunnel_cloudflared" "host" {
  account_id = var.account_id
  name       = "${var.name}-tunnel"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "host" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.host.id

  config = {
    warp_routing = {
      enabled = true
    }
    ingress = concat(
      [for s in var.services : {
        hostname = "${s.subdomain}.blima.dev"
        service  = s.proto == "ssh" ? "ssh://localhost:${s.port}" : "http://localhost:${s.port}"
      }],
      [{ service = "http_status:404" }]
    )
  }
}

# Um CNAME proxied por serviço, apontando para o túnel (nunca IP).
resource "cloudflare_dns_record" "svc" {
  for_each = { for s in var.services : s.subdomain => s }

  zone_id = var.zone_id
  name    = "${each.value.subdomain}.blima.dev"
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.host.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

# Um app Access por serviço; policies como recursos próprios (provider v5).
resource "cloudflare_zero_trust_access_application" "svc" {
  for_each = { for s in var.services : s.subdomain => s }

  account_id = var.account_id
  name       = "${var.name} ${each.value.subdomain}"
  domain     = "${each.value.subdomain}.blima.dev"
  type       = "self_hosted"

  destinations = [{
    type = "public"
    uri  = "${each.value.subdomain}.blima.dev"
  }]
}

resource "cloudflare_zero_trust_access_policy" "svc" {
  for_each = { for s in var.services : s.subdomain => s }

  account_id = var.account_id
  name       = each.value.access == "owner" ? "owner only" : "public"
  decision   = each.value.access == "owner" ? "allow" : "bypass"
  include = each.value.access == "owner" ? [{
    email = {
      email = var.owner_email
    }
  }] : []
}
