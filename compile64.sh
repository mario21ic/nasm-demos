#2/bin/bash
set -e
nasm -f elf64 hello64.asm && ld -o hello64 hello64.o && ./hello64
rm -f hello64.o hello64
