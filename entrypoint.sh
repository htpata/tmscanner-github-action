#!/bin/bash

echo "inside entrypoint.sh 1"
echo ${1}
echo ${2}
echo ${3}
echo "inside entrypoint.sh 2"

set -e

if [[ -z "${TM_TOKEN}" ]]; then
  echo "Error: missing TM_TOKEN env variable"
  exit 1
fi

# cd /app
echo "$(ls -la)"

python /app/tm_analyze.py ${1} ${2} ${3}
