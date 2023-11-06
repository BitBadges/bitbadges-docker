# Bootstrap using th express container
bootstrap:
	docker run --rm --it -v bitbadges_docker_express:latest bootstrap

build:
	docker compose build

start:
	docker compose up -d

start-and-bootstrap: 
	docker compose up -d && make bootstrap

