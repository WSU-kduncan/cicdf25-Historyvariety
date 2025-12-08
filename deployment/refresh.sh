#!/bin/bash

# Docker image and container names
IMAGE="historyvariety/project4:latest"	#  DockerHub image to pull
CONTAINER="project4-app"		#  Local container name

echo "Stopping the old container..."
docker stop $CONTAINER || true	# docker stop - stops the running container
#  || true makes the script continue even if stop fails
docker rm $CONTAINER || true	# removes the old container to free up the name for a new one

echo "Pulling the latest image..."
docker pull $IMAGE

echo "Starting a new container..."
docker run -d \	# Run in detached mode
  --name $CONTAINER \	# give container name
  -p 80:80 \	# map to port 80
  --restart unless-stopped \	# Restart
  $IMAGE

echo "Deployment refresh complete!"

