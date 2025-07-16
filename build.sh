#!/usr/bin/env bash
set -e

IMAGE_NAME="jetson-xavier-python310-immich-ml"
TAG="jetpack5.1.3"

echo "Building Docker image ${IMAGE_NAME}:${TAG}..."
docker build -t ${IMAGE_NAME}:${TAG} .
echo "Build complete."
