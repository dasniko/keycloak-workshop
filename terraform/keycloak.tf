# Create realm
resource "keycloak_realm" "realm" {
  realm               = var.realm_name
  enabled             = true
  display_name        = "😊 Smiling Bookshop 📚"
  display_name_html   = "<div class=\"logo-text\"><span>😊 Smiling Bookshop 📚</span></div>"
  smtp_server {
    host = "mail"
    port = "1025"
    from = "bookshop@keycloak.local"
  }
}

# Role erstellen
resource "keycloak_role" "user_role" {
  realm_id    = keycloak_realm.realm.id
  name        = "admin"
  description = "Demo user role"
}
