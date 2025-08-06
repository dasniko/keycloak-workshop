output "realm_id" {
  description = "ID of the created realm"
  value       = keycloak_realm.realm.id
}

#output "client_id" {
#  description = "ID of the created shop client"
#  value       = keycloak_openid_client.shop.id
#}

#output "shop_client_secret" {
#  description = "Secret of the created shop client"
#  value       = keycloak_openid_client.shop.client_secret
#  sensitive   = true
#}
