# Quick Start

Clone this repo first. You'll need local files:
```sh
git clone https://github.com/lomik/graphite-clickhouse-tldr
cd graphite-clickhouse-tldr
```

## Docker-Compose
```sh
cd compose
docker-compose up
```
Open http://127.0.0.1/ in browser

### Mapped Ports

Host | Container | Service
---- | --------- | -------------------------------------------------------------------------------------------------------------------
  80 |        80 | [nginx](https://www.nginx.com/resources/admin-guide/)
2003 |      2003 | [carbon receiver - plaintext](http://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-plaintext-protocol)
2004 |      2004 | [carbon receiver - pickle](http://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-pickle-protocol)
2006 |      2006 | [carbon receiver - prometheus remote write](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#%3Cremote_write%3E)

# Kubernetes

This install assumes you can install the clickhouse-operator in the kube-system namespace.
See https://github.com/Altinity/clickhouse-operator/blob/master/docs/quick_start.md#clickhouse-operator-installation

## Setup

```sh
cd k8s
./ch-operator-install.sh
sleep 10 #wait for operator
kubectl apply -f stats-conf.yaml #note, you may need to tweak
```

## Running

```sh
kubectl apply -f ch-stats.yaml
sleep 10 #you should watch for clickhouse to finish coming up:
watch kubectl get pods # ctrl-c out when the pods are ready
kubectl apply -f services.yaml
watch kubectl get pods # ctrl-c out when services are online
kubectl port-forward service/stat-web 9000:80
```
Open http://127.0.0.1:9000/ in your browser
