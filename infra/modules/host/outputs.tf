output "tunnel_id" {
  value = cloudflare_zero_trust_tunnel_cloudflared.host.id
}

output "hostnames" {
  value = [for s in var.services : "${s.subdomain}.blima.dev"]
}
