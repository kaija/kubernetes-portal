img=k8s-portal
tag=setup
extratag=v15

.PHONY: all build run

all: build push

build:
	docker build -t kaija/${img}:${tag} .
run:
	docker run -d -p 8080:80 --name kubernetes-portal -e FQDN=localhost -e Region=ap-northeast-1 --add-host argocd-server.argocd:8.8.8.8 kaija/${img}:${tag}

push:
	docker tag kaija/${img}:${tag} kaija/${img}:${extratag}
	docker push kaija/${img}:${tag}
	docker push kaija/${img}:${extratag}

stop:
	docker stop kubernetes-portal
	docker rm kubernetes-portal
