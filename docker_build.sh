#!/bin/bash

IMAGE_NAME="spot_image"

echo "Initializing Git submodules..."
git submodule update --init --recursive

echo "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME -f Dockerfile .

if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME' built successfully!"
else
    echo "Docker image build failed!"
    exit 1
fi
