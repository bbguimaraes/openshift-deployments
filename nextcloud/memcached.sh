#!/bin/bash
set -euo pipefail

exec podman run \
    --name nextcloud-memcached \
    --detach \
    --user 1000150000:users \
    --network nextcloud \
    --network-alias memcached \
    --read-only \
    nextcloud-memcached
