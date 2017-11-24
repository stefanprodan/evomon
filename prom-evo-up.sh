#!/usr/bin/env bash
set -e

cd prom

export DOCKER_HOST=$1

if [ -n "$(docker stack ls | grep prom)" ]; then
    echo ""
else
    docker stack rm prom
fi

PROM_HOST=cluster01 \
PROM_IP=172.16.200.84 \
PROM_PATH=/mnt/disk1/nglm/nglm-base-runtime/prom \
docker stack deploy -c docker-compose.yml prom

docker service ls | grep prom_
