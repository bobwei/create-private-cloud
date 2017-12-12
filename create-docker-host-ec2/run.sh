#!/bin/bash

export $(cat $(dirname -- "$0")/.env | xargs)

docker-machine create \
  --driver=amazonec2 \
  --amazonec2-zone b \
  --engine-install-url $ENGINE_INSTALL_URL \
  $MACHINE_NAME
