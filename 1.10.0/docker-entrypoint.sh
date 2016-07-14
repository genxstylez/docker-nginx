#!/bin/bash

if [ "$1" = 'nginx' ]; then
    echo Starting nginx.
    envsubst '$$UPSTREAM_HOSTNAME $$UPSTREAM_PORT $$SERVER_NAME' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
fi

exec "$@"
