#!/bin/bash

set -e

RELDIR=$(dirname "$0")
cd $RELDIR
BASEDIR=$(pwd)

DOCKER_HUB_USER=sanguino

log () {
  echo ""
  echo -e "\033[0;31m Building and publishing $1 \033[0m"
  echo ""
}


log $DOCKER_HUB_USER/eolo-planner-server
cd $BASEDIR/server
docker build . -t $DOCKER_HUB_USER/eolo-planner-server
docker push $DOCKER_HUB_USER/eolo-planner-server


log $DOCKER_HUB_USER/eolo-planner-weatherservice
cd $BASEDIR/weatherservice
pack build $DOCKER_HUB_USER/eolo-planner-weatherservice --path . --builder gcr.io/buildpacks/builder:v1
docker push $DOCKER_HUB_USER/eolo-planner-weatherservice


log $DOCKER_HUB_USER/eolo-planner-toposervice
cd $BASEDIR/toposervice
mvn compile jib:build -Dimage=sanguino/eolo-planner-toposervice
docker push $DOCKER_HUB_USER/eolo-planner-toposervice


log $DOCKER_HUB_USER/eolo-planner-plannerservice
cd $BASEDIR/planner
docker build . -t $DOCKER_HUB_USER/eolo-planner-plannerservice
docker push $DOCKER_HUB_USER/eolo-planner-plannerservice
