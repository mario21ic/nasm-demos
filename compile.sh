#1/bin/bash
set -e

name=$(basename $1 .asm)
echo "Name: "$name
name_o=$name".o"
echo "Name object: "$name

#nasm -f elf $@
nasm -f elf -g $@

echo "## file $name_o"
file $name_o

echo "### ld -m elf_i386 -o $name $name_o"
ld -m elf_i386 -o $name $name_o

echo "## file $name"
file $name

echo "## size $name"
size $name

set +e
echo "### ldd $name"
ldd $name

echo "## readelf -a $name"
readelf -a $name

set -e
echo "### Running $name"
./$name

rm -rf $name_o $name

