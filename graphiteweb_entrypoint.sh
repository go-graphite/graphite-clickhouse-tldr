#!/bin/sh

# disable daemons
rm -rf /etc/service/brubeck
rm -rf /etc/service/carbon*
rm -rf /etc/service/collectd
rm -rf /etc/service/go-carbon
rm -rf /etc/service/statsd

exec /entrypoint "${@}"
