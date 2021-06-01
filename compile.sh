#1/bin/bash
set -e

name=$(basename $1 .asm)
echo "Name: "$name

#nasm -f elf $@
nasm -f elf -g $@
file $name.o

ld -m elf_i386 -o $name $name.o
file $name
size $name

set +e
ldd $name
readelf -a $name

set -e
./$name

rm -rf $name.o $name
