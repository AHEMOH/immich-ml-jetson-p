#!/usr/bin/env bash
set -e

IMAGE_NAME="jetson-xavier-python310-immich-ml"
TAG="jetpack5.1.3"
CONTAINER_NAME="immich-ml"

echo "Starting container ${CONTAINER_NAME}..."
docker run -it --rm \
  --runtime nvidia \
  --gpus all \
  --name ${CONTAINER_NAME} \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix/:/tmp/.X11-unix \
  -v "$(pwd)/workspace:/workspace" \
  ${IMAGE_NAME}:${TAG} \
  /bin/bash
