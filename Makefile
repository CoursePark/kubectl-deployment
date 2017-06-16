default: docker_build

DOCKER_IMAGE ?= bluedrop360/kubectl-deployment
DOCKER_TAG ?= latest

docker_build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	
docker_push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
