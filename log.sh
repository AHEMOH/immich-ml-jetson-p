#!/usr/bin/env bash
set -e

CONTAINER_NAME="immich-ml"
LOG_FILE="immich-ml.log"

echo "Streaming logs from container ${CONTAINER_NAME}..."
docker logs -f ${CONTAINER_NAME} 2>&1 | tee ${LOG_FILE}
