#!/bin/sh

# disable daemons
rm -rf /etc/service/carbon
rm -rf /etc/service/carbon-aggregator
rm -rf /etc/service/statsd

exec /sbin/my_init