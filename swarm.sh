#!/usr/bin/env bash
set -e

export DOCKER_HOST=$1

NODES_HOSTS=$(docker node ls --format "{{.Hostname}}")

NODEEXPORTER_PORT=9100
NODEEXPORTER_LIST=
CADVISOR_PORT=9701
CADVISOR_LIST=
for NODE_HOST in $NODES_HOSTS
do
   NODE_IP=$(docker node inspect ${NODE_HOST} --format '{{ .Status.Addr  }}')
   echo "${NODE_HOST} - ${NODE_IP}"
   if [ -n "$NODEEXPORTER_LIST" ]; then
     NODEEXPORTER_LIST="${NODEEXPORTER_LIST},'${NODE_IP}:${NODEEXPORTER_PORT}'"
   else
     NODEEXPORTER_LIST="'${NODE_IP}:${NODEEXPORTER_PORT}'"
   fi
   if [ -n "$CADVISOR_LIST" ]; then
     CADVISOR_LIST="${CADVISOR_LIST},'${NODE_IP}:${CADVISOR_PORT}'"
   else
     CADVISOR_LIST="'${NODE_IP}:${CADVISOR_PORT}'"
   fi
done

echo "Node Exporter list: ${NODEEXPORTER_LIST}"
echo "cAdvisor list: ${CADVISOR_LIST}"
