variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Token escopado (DNS edit em blima.dev + Zero Trust). Via env CLOUDFLARE_API_TOKEN (TF_VAR_cloudflare_api_token)."
}

variable "account_id" {
  type        = string
  description = "Cloudflare account ID (Zero Trust org)."
  default     = "26874353d6253131e22c3db274606249"
}

variable "zone_id" {
  type        = string
  description = "Zone ID de blima.dev."
  default     = "2558c3ebf8460f629fa99c3d23a48b28"
}

variable "owner_email" {
  type        = string
  description = "Email do owner para policies Access allow."
  default     = "luisborgeslima@icloud.com"
}
