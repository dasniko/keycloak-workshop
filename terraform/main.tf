terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = ">= 5.4.0"
    }
  }
}

provider "keycloak" {
    client_id     = "admin-cli"
    url           = var.keycloak_url
    username      = var.keycloak_admin_username
    password      = var.keycloak_admin_password
    initial_login = false
    tls_insecure_skip_verify = true
}
