variable "realm_id" {
    type = string
    default = "master"
    description = "The realm id to use for the Keycloak client"
}

variable "client_id" {
    type = string
    default = "jupyterhub"
    description = "The client id to use for the Keycloak client"
}

variable "root_url" {
  type = string
}
