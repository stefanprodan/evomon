#!/usr/bin/env bash
set -e

cd caddy

if docker stack ls | grep -q caddy
    then docker stack rm caddy
fi

CLUSTER01=172.16.200.84 \
docker stack deploy -c docker-compose.yml caddy
