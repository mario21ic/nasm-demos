#1/bin/bash
set -e

name=$(basename $1 .asm)
echo "Name: "$name

nasm -f elf $@
file $name.o

ld -m elf_i386 -o $name $name.o
file $name
./$name