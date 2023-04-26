#!/bin/bash

set -e

if [[ -z "${TM_TOKEN}" ]]; then
  echo "Error: missing TM_TOKEN env variable"
  exit 1
fi

cd /app

python tm_analyze.py ${1} ${2} ${3}
