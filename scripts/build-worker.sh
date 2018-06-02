#!/bin/sh

set -e

sha=$(git rev-parse --short HEAD)
tag="gcr.io/unpkg-server/worker:$sha"

docker build -t $tag -f Dockerfile.worker .
docker push $tag
