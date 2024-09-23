#!/bin/sh
set -e

name=$1
if [ -z $name ]; then
  echo "Preview environment name is required"
  exit 1
fi

if [ ! -z "$OKTETO_CA_CERT" ]; then
   echo "Custom certificate is provided"
   echo "$OKTETO_CA_CERT" > /usr/local/share/ca-certificates/okteto_ca_cert.crt
   update-ca-certificates
fi


timeout_flag=""
timeout=$2
if [ ! -z $timeout ]; then
timeout_flag="--timeout=$timeout"
fi

log_level=$3
if [ ! -z "$log_level" ]; then
  log_level="--log-level ${log_level}"
fi

# https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging
# https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables
if [ "${RUNNER_DEBUG}" = "1" ]; then
  log_level="--log-level debug"
fi


echo running: okteto preview destroy $name $log_level $timeout_flag
okteto preview destroy $name $log_level $timeout_flag