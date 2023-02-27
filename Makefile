uname_S := $(shell uname -s)

all: up create-database seed-database logs

up:
	docker-compose down -v
	docker-compose up -d

cli:
	docker-compose run --rm app bash

install-dependencies:
	docker-compose run --rm -w /usr/src/app app bash -c "yarn install"

logs:
	docker-compose logs -f

unit-test:
	docker-compose run --rm -w /usr/src/app app bash -c "yarn test"

lint:
	docker-compose run --rm -w /usr/src/app app bash -c "yarn lint"

create-database:
	chmod +x scripts/database-definition.sh
	./scripts/database-definition.sh

seed-database:
	chmod +x scripts/database-seeder.sh
	./scripts/database-seeder.sh

