#!/bin/bash
TARGET=${1:-}

podman build -t registry.lab/osanwe:$TARGET \
    -f Containerfile.$TARGET \
    && podman push registry.lab/osanwe:$TARGET
