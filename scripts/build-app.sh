#!/bin/sh

set -e

# Create a fresh client build.
yarn clean
yarn build

sha=$(git rev-parse --short HEAD)
tag="gcr.io/unpkg-server/app:$sha"

docker build -t $tag -f Dockerfile.app .
docker push $tag
