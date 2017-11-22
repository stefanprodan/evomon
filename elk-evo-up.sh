#!/usr/bin/env bash
set -e

cd elk

ESDATA1_HOST=swarm-worker-1 \
ESDATA1_IP=10.156.0.5 \
ESDATA2_HOST=swarm-worker-2 \
ESDATA2_IP=10.156.0.3 \
ESDATA3_HOST=swarm-worker-3 \
ESDATA3_IP=10.156.0.4 \
ESROUTER_HOST=swarm-manager-1 \
ESROUTER_IP=10.156.0.2 \
ESDATA_RAM=2G \
ESDATA_RAM_LIMIT=4G \
ESROUTER_RAM=512M \
ESROUTER_RAM_LIMIT=1G \
docker stack deploy -c docker-compose.yml elk

export ES_PUBLIC_IP=35.198.178.32

echo "Waiting for ES Cluster to be online and healthy..."
until $(curl -o /dev/null -s -XGET "${ES_PUBLIC_IP}:9200/_cluster/health?wait_for_status=green&timeout=50s&pretty"); do
    printf '.'
    sleep 5
done
echo ""
curl -XGET "${ES_PUBLIC_IP}:9200/_cat/health?v&pretty"

docker service ls | grep elk_
