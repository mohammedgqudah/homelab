```
helm repo add mattermost https://helm.mattermost.com
kubectl create ns mattermost-operator
helm install mattermost-operator mattermost/mattermost-operator -n mattermost-operator -f config.yaml
```
