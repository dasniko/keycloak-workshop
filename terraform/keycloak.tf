# Realm
resource "keycloak_realm" "realm" {
  realm   = var.realm_name
  enabled = true
}

# Clients
resource "keycloak_openid_client" "client-0" {
  realm_id                 = keycloak_realm.realm.id
  client_id                = "client-0"
  enabled                  = true
  access_type              = "CONFIDENTIAL"
  client_secret            = "client-0-secret"
  valid_redirect_uris      = ["*"]
  standard_flow_enabled    = true
  service_accounts_enabled = true
}
resource "keycloak_openid_client" "client-1" {
  realm_id                 = keycloak_realm.realm.id
  client_id                = "client-1"
  enabled                  = true
  access_type              = "CONFIDENTIAL"
  client_secret            = "client-1-secret"
  valid_redirect_uris      = ["*"]
  standard_flow_enabled    = true
  service_accounts_enabled = true
}
resource "keycloak_openid_client" "client-2" {
  realm_id                 = keycloak_realm.realm.id
  client_id                = "client-2"
  enabled                  = true
  access_type              = "CONFIDENTIAL"
  client_secret            = "client-2-secret"
  valid_redirect_uris      = ["*"]
  standard_flow_enabled    = true
  service_accounts_enabled = true
}

# Users
resource "keycloak_user" "user-0" {
  realm_id   = keycloak_realm.realm.id
  username   = "user-0"
  enabled    = true
  email      = "user-0@keycloak.de"
  first_name = "Firstname"
  last_name  = "Lastname"
  initial_password {
    value    = "user-0-password"
  }
}
resource "keycloak_user" "user-1" {
  realm_id   = keycloak_realm.realm.id
  username   = "user-1"
  enabled    = true
  email      = "user-1@keycloak.de"
  first_name = "Firstname"
  last_name  = "Lastname"
  initial_password {
    value    = "user-1-password"
  }
}
resource "keycloak_user" "user-2" {
  realm_id   = keycloak_realm.realm.id
  username   = "user-2"
  enabled    = true
  email      = "user-2@keycloak.de"
  first_name = "Firstname"
  last_name  = "Lastname"
  initial_password {
    value    = "user-2-password"
  }
}
resource "keycloak_user" "user-3" {
  realm_id   = keycloak_realm.realm.id
  username   = "user-3"
  enabled    = true
  email      = "user-3@keycloak.de"
  first_name = "Firstname"
  last_name  = "Lastname"
  initial_password {
    value    = "user-3-password"
  }
}
resource "keycloak_user" "user-4" {
  realm_id   = keycloak_realm.realm.id
  username   = "user-4"
  enabled    = true
  email      = "user-4@keycloak.de"
  first_name = "Firstname"
  last_name  = "Lastname"
  initial_password {
    value    = "user-4-password"
  }
}
