#!/bin/bash

IMAGE_NAME="spot_image"

echo "Launching Docker container from image: $IMAGE_NAME"

docker run -it \
    --rm \
    --hostname spot_container \
    --network host \
    -e TERM=xterm-256color \
    -v $(pwd)/src/packages:/home/spot/spot_ws/src/packages \
    -w /home/spot/spot_ws \
    --name spot_container \
    $IMAGE_NAME
