FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y nasm gcc file

WORKDIR /src/
VOLUME /src/
