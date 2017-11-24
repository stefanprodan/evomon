#!/usr/bin/env bash
set -e

cd prom

export DOCKER_HOST=$1

PROM_HOST=cluster01 \
PROM_IP=172.16.200.84 \
docker stack deploy -c docker-compose.yml prom

docker service ls | grep prom_
