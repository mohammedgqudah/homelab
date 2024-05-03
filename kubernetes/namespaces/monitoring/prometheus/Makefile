.PHONY: config

all: config

config:
	@ kubectl create configmap prometheus-config --from-file=prometheus.yml -o yaml --dry-run=client | kubectl apply -f -

