helm repo add goauthentik https://charts.goauthentik.io/
helm upgrade --install authentik goauthentik/authentik --version 2026.5.2 -f default/authentik/values.yml 
