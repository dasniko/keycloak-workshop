variable "keycloak_url" {
  description = "Keycloak Server URL"
  type        = string
  default     = "https://localhost:8443"
}

variable "keycloak_admin_username" {
  description = "Keycloak Admin Username"
  type        = string
  default     = "admin"
}

variable "keycloak_admin_password" {
  description = "Keycloak Admin Password"
  type        = string
  sensitive   = true
}

variable "realm_name" {
  description = "Name of the Keycloak Realm"
  type        = string
  default     = "bookshop"
}
