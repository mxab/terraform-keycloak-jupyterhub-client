resource "keycloak_openid_client" "jupyterhub" {
  realm_id  = var.realm_id
  client_id = var.client_id

  enabled = true

  access_type = "CONFIDENTIAL"

  standard_flow_enabled = true
  root_url              = var.root_url
  base_url              = "/"
  valid_redirect_uris = [
    "/hub/oauth_callback"
  ]
  web_origins = ["+"]
  admin_url   = "/"
}

resource "keycloak_role" "user" {
  realm_id    = keycloak_realm.realm.id
  client_id   = keycloak_openid_client.jupyterhub.id
  name        = "user"
}
resource "keycloak_role" "admin" {
  realm_id    = keycloak_realm.realm.id
  client_id   = keycloak_openid_client.jupyterhub.id
  name        = "admin"

  composite_roles = [
    keycloak_role.user.id
  ]
}
