include srcs/.env
COMPOSE_FILE = srcs/docker-compose.yml

all: create build up

create:
	mkdir -p ${PATH_WP_VOL}
	mkdir -p ${PATH_DB_VOL}

build:
	docker compose -f $(COMPOSE_FILE) build --no-cache

up:
	docker compose -f $(COMPOSE_FILE) up 

ps:
	docker compose -f $(COMPOSE_FILE) ps

down:
	docker compose -f $(COMPOSE_FILE) down

clean: down
	sudo docker compose -f $(COMPOSE_FILE) down --volumes
	sudo rm -rf ${PATH_WP_VOL}
	sudo rm -rf ${PATH_DB_VOL}

re: clean all

.PHONY: all build up down clean re create ps