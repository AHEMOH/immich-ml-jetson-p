#!/usr/bin/env bash
set -e

IMAGE_NAME="jetson-xavier-python310-immich-ml"
TAG="jetpack5.1.3"
CONTAINER_NAME="immich-ml"

echo "Starting container ${CONTAINER_NAME}..."
docker run -it --rm \
  --runtime nvidia \
  --gpus all \
  --privileged \
  -v /proc/device-tree:/proc/device-tree:ro \
  --device /dev/nvhost-ctrl \
  --device /dev/nvhost-ctrl-gpu \
  --device /dev/nvhost-prof-gpu \
  --device /dev/nvhost-gpu \
  --device /dev/nvmap \
  nvcr.io/nvidia/l4t-jetpack:r35.5.0 \
  /usr/bin/env bash
