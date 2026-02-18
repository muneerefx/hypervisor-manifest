#!/bin/bash

# List of required environment variables
REQUIRED_VARS=(
  "TAG_COUNT"
  "PROJECT_NAME"
  "PRODUCTION_NAME"
  "PIPELINE"
  "BUILD_DIR"
  "TEMP_BRANCH"
)

echo "Checking required environment variables..."
echo "-------------------------------------------"

for VAR in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!VAR+x}" ]; then
    echo "$VAR : NOT SET"
  elif [ -z "${!VAR}" ]; then
    echo "$VAR : SET but EMPTY"
  else
    echo "$VAR : SET -> ${!VAR}"
  fi
done

