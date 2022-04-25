VERSION 0.6 # Earthly

# Base
FROM alpine
RUN apk --update --no-cache add git gcc file nasm
WORKDIR /app

all:
    BUILD +build
    #BUILD +docker

deps:
    COPY go.mod go.sum ./
    COPY lib ./lib
    RUN go mod download
    SAVE ARTIFACT go.mod AS LOCAL go.mod
    SAVE ARTIFACT go.sum AS LOCAL go.sum

build:
    COPY ./* ./
    ARG file_name
    #RUN echo "build $file_name"
    RUN nasm -f elf -g $file_name -o demo.o
    RUN ld -m elf_i386 -o ./demo demo.o
    #SAVE ARTIFACT ./demo /demo # Grabar en / para luego copiar en otro target
    SAVE ARTIFACT ./demo /demo AS LOCAL build/demo

run:
    ARG file_name
    #RUN echo "run $file_name"
    BUILD +build --file_name=$file_name
    COPY +build/demo ./ # Copiando desde /demo
    #RUN file demo
    RUN ./demo
