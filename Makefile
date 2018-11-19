-include .env

TARGET_HOST ?= mon.usglobalmail.com
SERVICE ?= swarmprom

export

deploy:
	docker stack deploy -c docker-compose.yml $(SERVICE)

undeploy:
	docker stack rm $(SERVICE)
	
logs-%:
	docker service logs $(SERVICE)_$* -f

sleep-%:
	sleep $*
