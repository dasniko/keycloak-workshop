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

variable "realm_name" {
  description = "Name of the Keycloak Realm"
  type        = string
  default     = "bookshop"
}
