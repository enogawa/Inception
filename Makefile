up:
	docker compose -f src/docker-compose.yml up --build -d

build:
	docker compose -f src/docker-compose.yml build

stop:
	docker compose -f src/docker-compose.yml stop

clean:
	docker compose -f src/docker-compose.yml down --rmi all -v

restart:
	docker compose -f src/docker-compose.yml down --rmi all -v && docker compose -f src/docker-compose.yml up --build -d

nginx:
	docker compose -f src/docker-compose.yml exec nginx bash

mariadb:
	docker compose -f src/docker-compose.yml exec mariadb bash

wordpress:
	docker compose -f src/docker-compose.yml exec wordpress bash

logs:
	docker compose -f src/docker-compose.yml logs

.PHONY: all build stop clean exec-nginx ips prune-images prune logs