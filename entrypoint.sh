#!/bin/sh
set -e

name=$1
if [ -z $name ]; then
  echo "Preview environment name is required"
  exit 1
fi

echo running: okteto preview destroy $name
okteto preview destroy $namespace