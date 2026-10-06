# Hosts plugáveis: 1 ficheiro por host, só aditivo.
# Host novo = copiar este ficheiro, mudar name/ssh_user/services.

module "mac_mini" {
  source = "../modules/host"

  name        = "mac"
  ssh_user    = "luisf"
  account_id  = var.account_id
  zone_id     = var.zone_id
  owner_email = var.owner_email

  # ssh.mac.blima.dev entra aqui quando o host tiver nome próprio;
  # ssh.blima.dev legado fica em cloudflare.tf até migrar.
  services = []
}
