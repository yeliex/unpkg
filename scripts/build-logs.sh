#!/bin/sh

set -e

sha=$(git rev-parse --short HEAD)
tag="gcr.io/unpkg-server/logs:$sha"

docker build -t $tag -f Dockerfile.logs .
docker push $tag
