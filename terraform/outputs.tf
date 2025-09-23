output "realm_id" {
  description = "ID of the created realm"
  value       = keycloak_realm.realm.id
}

output "client_id_0" {
  description = "ID of the created client-0"
  value       = keycloak_openid_client.client-0.id
}

output "user_id_0" {
  description = "ID of the created user-0"
  value       = keycloak_user.user-0.id
}
