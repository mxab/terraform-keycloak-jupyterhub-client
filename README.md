# Keycloak Client for Jupyterhub

Creates a keycloak client and and user and administor role for jupyterhub.

## Usage


```

module "keycloak_jupyterhub" {

  source  = "mxab/jupyterhub-client/keycloak"
  version = "0.1.0"

  realm_id    = "my-realm"
  client_id   = "jupyterhub" # default
}

```


## Jupyterhub Config

```python

# change 'jupyterhub' if you change the client name

c.GenericOAuthenticator.claim_groups_key = lambda r: r.get("resource_access").get('jupyterhub').get('roles')
c.GenericOAuthenticator.admin_groups = ['admin']
c.GenericOAuthenticator.allowed_groups = ['user']
c.GenericOAuthenticator.scope = ['openid', 'profile', ...]

...

c.GenericOAuthenticator.oauth_callback_url = "https://jupyterhub.example.com/hub/oauth_callback"
c.GenericOAuthenticator.client_id = 'jupyterhub'
c.GenericOAuthenticator.client_secret = '<client secret from the client tab in keycloak>'
c.GenericOAuthenticator.login_service = 'keycloak'
# adjust to your keycloak server / realm
c.GenericOAuthenticator.authorize_url = 'https://keycloak.example.com/realms/master/protocol/openid-connect/auth'
c.GenericOAuthenticator.token_url = 'https://keycloak.example.com/realms/master/protocol/openid-connect/token'
c.GenericOAuthenticator.userdata_url = 'https://keycloak.example.com//realms/master/protocol/openid-connect/userinfo'

c.GenericOAuthenticator.username_key = 'preferred_username'
c.GenericOAuthenticator.userdata_params = {'state': 'state'}
```