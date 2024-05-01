# source: https://github.com/python-discord/infra/blob/main/kubernetes/namespaces/monitoring/alerts/Makefile
.PHONY: provision dashboards

all: provision dashboards

# Upload provisioning files to kubernetes
provision:
	@ kubectl create configmap grafana-provisioning --from-file=provisioning/ -o yaml --dry-run=client | kubectl apply -f -

# Upload the dashboards to kubernetes
dashboards:
	@ kubectl create configmap grafana-dashboards --from-file=dashboards/ -o yaml --dry-run=client | kubectl apply --server-side=true -f -
