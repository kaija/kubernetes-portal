img=k8s-portal
tag=setup

.PHONY: all build run

all: build push

build:
	docker build -t kaija/${img}:${tag} .
run:
	docker run -d -p 8080:80 -e FQDN=localhost -e Region=ap-northeast-1 --add-host argocd-server.argocd:8.8.8.8 kaija/${img}:${tag}

push:
	docker push kaija/${img}:${tag}
