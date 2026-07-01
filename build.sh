#!/bin/bash
TARGET=${1:-}

podman build -t registry.lab/bases:$TARGET \
    --pull-always --no-cache \
    -f Containerfile.$TARGET \
    && podman push registry.lab/bases:$TARGET
