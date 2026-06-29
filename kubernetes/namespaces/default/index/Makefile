IMAGE = git.hyperserver.dev/hyper/hyperserver-index

.PHONY: build
build:
	docker build -t $(IMAGE):latest .

.PHONY: push
push:
	docker push $(IMAGE):latest

run:
	docker run --mount type=bind,source=./site,target=/usr/share/nginx/html --rm -p 8001:80 $(IMAGE):latest
