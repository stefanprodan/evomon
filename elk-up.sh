#!/usr/bin/env bash

cd elk

ESDATA1_HOST=swarm-worker-1 \
ESDATA1_IP=10.156.0.5 \
ESDATA2_HOST=swarm-worker-2 \
ESDATA2_IP=10.156.0.3 \
ESDATA3_HOST=swarm-worker-3 \
ESDATA3_IP=10.156.0.4 \
ESROUTER_HOST=swarm-manager-1 \
ESROUTER_IP=10.156.0.2 \
docker stack deploy -c docker-compose.yml elk
