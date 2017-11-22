#!/usr/bin/env bash
set -e

cd elk

export DOCKER_HOST=$1

ESDATA1_HOST=cluster03 \
ESDATA1_IP=172.16.200.118 \
ESDATA2_HOST=cluster06 \
ESDATA2_IP=172.16.200.117 \
ESDATA3_HOST=cluster02 \
ESDATA3_IP=172.16.200.114 \
ESROUTER_HOST=cluster04 \
ESROUTER_IP=172.16.200.115 \
ESDATA_RAM=16G \
ESDATA_RAM_LIMIT=32G \
ESROUTER_RAM=6G \
ESROUTER_RAM_LIMIT=12G \
ESDATA_PATH=/mnt/disk1/nglm/nglm-base-runtime \
docker stack deploy -c evo-compose.yml elk

export ES_PUBLIC_IP=172.16.200.115

echo "Waiting for ES Cluster to be online and healthy..."
until $(curl -o /dev/null -s -XGET "${ES_PUBLIC_IP}:9200/_cluster/health?wait_for_status=green&timeout=50s&pretty"); do
    printf '.'
    sleep 5
done
echo ""
curl -XGET "${ES_PUBLIC_IP}:9200/_cat/health?v&pretty"

docker service ls | grep elk_
