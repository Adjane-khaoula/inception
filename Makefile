# Define variables
COMPOSE_FILE = srcs/docker-compose.yml
IMAGE_NAME = image_name

# Run Docker Compose to create containers
compose-up:
	@docker-compose -f $(COMPOSE_FILE) up --build -d

# Stop and remove containers created by Docker Compose
compose-down:
	@docker-compose -f $(COMPOSE_FILE) down

# Remove Docker Compose-managed volumes
clean-volumes:
	@docker-compose -f $(COMPOSE_FILE) down -v

# Remove Docker Compose-managed networks
clean-networks:
	@docker network prune -f

# Remove Docker images
clean-images:
	@docker rmi -f `docker images -aq`

# Remove all containers (including running ones)
clean-containers:
	@docker rm -f `docker ps -aq`

clean-cach:
	@docker system prune -f

# Clean everything (containers, volumes, networks, images)
clean-all: compose-down clean-volumes clean-networks clean-images clean-containers

# Build the Docker image
build:
	@docker build -t $(IMAGE_NAME) .

