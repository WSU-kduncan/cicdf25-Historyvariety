#!/bin/bash

# Docker image and container names
IMAGE="historyvariety/project4:latest"	#  DockerHub image to pull
CONTAINER="project4-app"		#  Local container name

echo "Pulling the latest image from Docker Hub..."
docker pull $IMAGE

echo "Stopping the old container..."
docker stop $CONTAINER || true	# docker stop - stops the running container
#  || true makes the script continue even if stop fails
docker rm $CONTAINER || true	# removes the old container to free up the name for a new one

echo "Starting a new container..."
# Run in detached mode, give container name, map port 80, restart unless stopped
docker run -d \
  --name $CONTAINER \
  -p 80:80 \
  --restart unless-stopped \
  $IMAGE

echo "Deployment refresh complete!"

