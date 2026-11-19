# Gateway

https://gateway.envoyproxy.io/

## Apply

```
kubectl create namespace gateway
kubectl apply -f namespaces/gateway/envoyproxy.yml
kubectl apply -f namespaces/gateway/gateway.yml
kubectl apply -f namespaces/gateway/clienttrafficpolicy.yml
```
