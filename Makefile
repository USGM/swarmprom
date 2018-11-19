-include .env

TARGET_HOST ?= mon.usglobalmail.com

export

deploy:
	docker stack deploy -c docker-compose.yml mon

undeploy:
	docker stack rm mon
