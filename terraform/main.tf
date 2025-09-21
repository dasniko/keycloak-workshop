terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = ">= 5.4.0"
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
