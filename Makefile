
-include .env
-include .env.$(TARGET)

STACK ?= swarmprom

export

all: dc-build dc-push undeploy sleep-20 deploy

dc-%:
	docker-compose $*

sleep-%:
	sleep $*
	
undeploy: DOCKER_HOST=$(SWARM_ADDR)
undeploy:
	docker stack rm $(STACK)
	
deploy: DOCKER_HOST=$(SWARM_ADDR)
deploy:
	docker stack deploy -c docker-compose.yml $(STACK) --with-registry-auth
	
logs-%: DOCKER_HOST=$(SWARM_ADDR)
logs-%:
	docker service logs $(STACK)_$* -f
