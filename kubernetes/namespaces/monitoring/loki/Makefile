.PHONY: config

all: config

config:
	@ kubectl create configmap loki-config --from-file=loki.yml -o yaml --dry-run=client | kubectl apply -f -
