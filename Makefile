#################
# T A R G E T S #
#################

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

###############
# D O C K E R #
###############

up:
	docker network create environment_docker-boilerplate || true
	# docker-compose -f ./ops/development/docker/db.yml -p db up -d
	# docker-compose -f ./ops/development/docker/redis.yml -p redis up -d
	docker-compose -f ./ops/development/docker/server.yml -p server up -d --build

down:
	docker rm -f $$(docker ps -aqf "name=docker-boilerplate-") || true
