.PHONY: config

all: config

config:
	@ kubectl create configmap d5dk8s-config --from-file=d5dk8s.yml -o yaml --dry-run=client | kubectl apply -f -
