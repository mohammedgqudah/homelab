# Ingress Nginx
Nginx is the ingress controller for this cluster.

## Installation
Using the helm chart, based on the [documentation](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start).
```
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
    --values namespaces/ingress-nginx/nginx/values.yml
```
