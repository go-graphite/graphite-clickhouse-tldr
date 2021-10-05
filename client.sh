#!/bin/sh

export UID
docker-compose exec -e HOME=/var/lib/clickhouse/ clickhouse clickhouse-client
