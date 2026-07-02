.PHONY build up down clean

# This is the demo make file used to create control on the command and reduce the manual workflow where you have to knwo each command instead of you just write the make and the command name 


# These are the variables
DOCKER_COMPOSE := docker-compose

OS := $(shell uname)

build: 
ifeq ($(OS), Linux)
	@echo "Running in $(OS)"
	$(DOCKER_COMPOSE) build
endif
ifeq ($(OS), Windows_NT)
	@echo "Please add windows commands"
endif


up: 
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clean: 
	docker system prune -y
