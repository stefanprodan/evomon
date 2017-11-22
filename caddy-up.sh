#!/usr/bin/env bash
set -e

cd caddy


CLUSTER01=172.16.200.84 \
docker stack deploy -c docker-compose.yml caddy
