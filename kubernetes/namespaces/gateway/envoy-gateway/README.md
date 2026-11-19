# Envoy Gateway

## Install

```
helm install eg oci://docker.io/envoyproxy/gateway-helm \
  --version v1.10.0 \
  --namespace envoy-gateway-system --create-namespace

kubectl wait --timeout=5m -n envoy-gateway-system \
  deployment/envoy-gateway --for=condition=Available
```

