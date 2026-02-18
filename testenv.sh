#!/usr/bin/env bash

cd "$BUILD_DIR"

mkdir -p my4444444444444444
cd my4444444444444444

git clone -b "$TEMP_BRANCH" git@github.com:muneerefx/hypervisor-manifest.git

touch "$TAG_COUNT"
