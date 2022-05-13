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

echo running: okteto preview destroy $name
okteto preview destroy $name