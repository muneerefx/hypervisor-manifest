#!/bin/bash
set -euxo pipefail

: "${BUILD_DIR:?BUILD_DIR not set}"
: "${TEMP_BRANCH:?TEMP_BRANCH not set}"
: "${BUILD_TAG:?BUILD_TAG not set}"

echo "BUILD_TAG     = $BUILD_TAG"
echo "BUILD_DIR     = $BUILD_DIR"
echo "TEMP_BRANCH   = $TEMP_BRANCH"

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

curl -L https://storage.googleapis.com/git-repo-downloads/repo -o repo
chmod +x repo

export PATH="$BUILD_DIR:$PATH"

./repo init \
    -u git@github.com:muneerefx/hypervisor-manifest.git \
    -b "$TEMP_BRANCH" \
    -m default.xml

./repo sync -j2

echo "$BUILD_TAG" > BUILD_TAG.txt

echo "Workspace ready in: $BUILD_DIR"
