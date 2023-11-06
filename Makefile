# Bootstrap using the express container
start:
	docker compose up -d

bootstrap:
	docker run --rm -it bitbadges-docker-express:latest bootstrap

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

pull:
	git clean -idf
	git pull origin $(shell git rev-parse --abbrev-ref HEAD)
	docker compose build --no-cache
