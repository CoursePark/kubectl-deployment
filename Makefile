default: build

DOCKER_IMAGE ?= bluedrop360/kubectl-deployment
DOCKER_TAG ?= latest

build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	
push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
