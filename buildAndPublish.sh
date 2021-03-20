#!/bin/bash

set -e

BASEDIR=$(dirname "$0")
DOCKER_HUB_USER=sanguino


cd $BASEDIR/server
docker build . -t $DOCKER_HUB_USER/eolo-planner-server
docker push $DOCKER_HUB_USER/eolo-planner-server


cd $BASEDIR/weatherservice
pack build $DOCKER_HUB_USER/eolo-planner-weatherservice --path . --builder gcr.io/buildpacks/builder:v1
docker push $DOCKER_HUB_USER/eolo-planner-weatherservice

