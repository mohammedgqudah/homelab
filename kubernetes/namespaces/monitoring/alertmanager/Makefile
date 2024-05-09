.PHONY: config

all: config

config:
	@ kubectl create configmap alertmanager-config --from-file=alertmanager.yml -o yaml --dry-run=client | kubectl apply -f -
