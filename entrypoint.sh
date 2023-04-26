#!/bin/bash

set -e

if [[ -z "${TM_TOKEN}" ]]; then
  echo "Error: missing TM_TOKEN env variable"
  exit 1
fi

cd /app

python tm_analyze.py ${ENV_TM_URL} ${ENV_TM_REPOSITORY_ID} ${ENV_TM_SOURCE}
