helm repo add goauthentik https://charts.goauthentik.io/
helm upgrade --install authentik goauthentik/authentik -f default/authentik/values.yml 
