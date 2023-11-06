# Bootstrap using th express container
start:
	docker compose up -d

bootstrap:
	docker run --rm -it -v bitbadges_docker_express:latest bootstrap

build:
	docker compose build

start-and-bootstrap: 
	docker compose up -d && make bootstrap

reset:
	docker compose down --volumes && make start-and-bootstrap

stop:
	docker compose down

prune: 
	docker system prune