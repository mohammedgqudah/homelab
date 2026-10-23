helm repo add goauthentik https://charts.goauthentik.io/
helm upgrade --install authentik goauthentik/authentik --version 2026.8.5 -f default/authentik/values.yml 
