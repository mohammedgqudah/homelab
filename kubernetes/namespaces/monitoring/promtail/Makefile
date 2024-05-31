.PHONY: config

all: config

config:
	@ kubectl create configmap promtail-config --from-file=promtail-config.yml -o yaml --dry-run=client | kubectl apply -f -
