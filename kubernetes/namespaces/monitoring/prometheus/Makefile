.PHONY: config rules

all: config rules

config:
	@ kubectl create configmap prometheus-config --from-file=prometheus.yml -o yaml --dry-run=client | kubectl apply -f -

rules:
	@ kubectl create configmap prometheus-rules --from-file=rules.d/ -o yaml --dry-run=client | kubectl apply -f -
