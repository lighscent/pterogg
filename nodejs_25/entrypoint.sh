#!/bin/bash
cd /home/container

export TZ=${TZ:-UTC}
export INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')

MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
echo ":/home/container$ ${MODIFIED_STARTUP}"

exec ${MODIFIED_STARTUP}
