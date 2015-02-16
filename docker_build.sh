#!/bin/bash

set -e
cd $WORKSPACE
git checkout $VERSION
VERSION_NAME=${VERSION#release\/}

sudo docker build -t musashi/nsenter:$VERSION_NAME .
sudo docker tag musashi/nsenter:$VERSION_NAME $DOCKER_BASE_URL/musashi/nsenter:$VERSION_NAME
sudo docker push $DOCKER_BASE_URL/musashi/nsenter:$VERSION_NAME