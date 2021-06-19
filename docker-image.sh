#!/bin/bash
set -e

file_src="1-suma_resta.asm"
if [ ! -z $1 ]; then
    file_src=$1
fi

docker build -t mario21ic/nasm:latest --build-arg FILE_SRC=$file_src -f Dockerfile.multistage ./
docker run --rm mario21ic/nasm:latest

