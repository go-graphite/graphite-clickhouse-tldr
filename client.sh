#!/bin/sh

docker-compose exec clickhouse bash -c "
    export HOME=/var/lib/clickhouse/
    exec clickhouse client
"