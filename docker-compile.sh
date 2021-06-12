#!/bin/bash
set -e

docker run --rm -ti -v $PWD:/app/ mario21ic/nasm bash -c "./compile.sh $1"
