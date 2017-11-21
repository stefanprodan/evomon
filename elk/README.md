### Docker Swarm ELK v6

Stack up:

```bash
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
```

### Queries

Cluster health:

```bash
curl -XGET '35.198.137.226:9200/_cat/health?v&pretty'
```

List indices:

```bash
curl -XGET '35.198.137.226:9200/_cat/indices?v&pretty'
```

Indices settings:

```bash
curl -XGET '35.198.137.226:9200/_all/_settings?pretty'
```

Copy index:

```bash
curl -XPOST '35.198.178.32:9200/_reindex?pretty' -H 'Content-Type: application/json' -d' { "source": { "index": "logstash-2017.11.18" }, "dest": { "index": "logstash-2017.11.17" } } '
```

