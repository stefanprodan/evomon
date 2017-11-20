### Docker Swarm ELK v6

Services:

* Elastic Search (3 nodes)
* Logstash (global)
* Logsprout (global)
* Kibana 
* Curator

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

