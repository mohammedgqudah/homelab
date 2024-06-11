.PHONY: config

all: config

config:
	@ kubectl create configmap kube-inspector-bot-config --from-file=bot.yml -o yaml --dry-run=client | kubectl apply -f -
