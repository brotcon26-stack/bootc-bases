#!/bin/bash
TARGET=${1:-}

declare -A BASES=(
    [centos]="quay.io/centos-bootc/centos-bootc:stream9"
    [alma]="quay.io/almalinuxorg/almalinux-bootc:9"
    [fedora]="quay.io/fedora/fedora-bootc:latest"
    [rawhide]="quay.io/fedora/fedora-bootc:rawhide"
)

BASE_IMAGE=${BASES[$TARGET]:?Unknown target: $TARGET}

podman build -t registry.lab/bases:$TARGET \
    --build-arg BASE_IMAGE="$BASE_IMAGE" \
    --pull-always --no-cache \
    -f Containerfile.dnf_base \
    && podman push registry.lab/bases:$TARGET
