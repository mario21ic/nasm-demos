#!/bin/bash
set -e

docker run --rm -ti -v $PWD:/src/ mario21ic/nasm:build bash -c "./compile.sh $1"
