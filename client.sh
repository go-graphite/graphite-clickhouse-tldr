#!/bin/sh

docker-compose exec -e HOME=/var/lib/clickhouse/ clickhouse clickhouse-client
