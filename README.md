# graphite-clickhouse-tldr
Graphite-ClickHouse + Grafana + StatsD with Docker-compose

# Quick Start
```sh
git clone https://github.com/kolobaev/graphite-clickhouse-tldr.git
cd graphite-clickhouse-tldr
docker-compose up
```
Open http://127.0.0.1:3000/ in browser

## Work scheme
![schema.jpg](doc/schema.png?v3)

### Mapped Ports

Host | Container | Service
---- | --------- | -------------------------------------------------------------------------------------------------------------------
  80 |        80 | [carbonapi](https://github.com/go-graphite/carbonapi)
3000 |      3000 | [grafana (admin:admin)](https://github.com/grafana/grafana)
8126 |      8126 | [bioyino (StatsD)](https://github.com/avito-tech/bioyino)
2003 |      2003 | [carbon receiver - plaintext](http://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-plaintext-protocol)
2004 |      2004 | [carbon receiver - pickle](http://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-pickle-protocol)
2006 |      2006 | [carbon receiver - prometheus remote write](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#%3Cremote_write%3E)
