terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = ">= 5.8.0"
    }
  }
}

provider "keycloak" {
    client_id     = var.keycloak_client_id
    client_secret = var.keycloak_client_secret
    url           = var.keycloak_url
    initial_login = false
    tls_insecure_skip_verify = true
}

variable "keycloak_client_id" {
  description = "Keycloak Admin Client"
  type        = string
  default     = "terraform"
}

variable "keycloak_client_secret" {
  description = "Keycloak Admin Client Secret"
  type        = string
  sensitive   = true
}

variable "keycloak_url" {
  description = "Keycloak Server URL"
  type        = string
  default     = "https://localhost:8443"
}
