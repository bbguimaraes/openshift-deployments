#!/bin/bash
set -euo pipefail

vol=/mnt/bbguimaraes0-vol/gitlab
exec docker run \
    --name gitlab-sidekiq \
    --detach \
    --user 1000170000:users \
    --network gitlab \
    --network-alias sidekiq \
    --read-only \
    --tmpfs /tmp \
    --tmpfs /var/log/gitlab \
    --volume "$vol/etc:/etc/webapps:z" \
    --entrypoint bundle \
    gitlab-puma \
    exec sidekiq \
    -e production \
    -C config/sidekiq_queues.yml
