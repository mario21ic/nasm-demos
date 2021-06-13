#!/bin/bash
set -e

nasm -f bin -o bootloader.bin  29-bootloader.asm
file bootloader.bin

dd if=/dev/zero of=bootloader.iso count=2880
file bootloader.iso

dd if=bootloader.bin of=bootloader.iso
file bootloader.iso

qemu-system-x86_64 -drive format=raw,file=bootloader.iso

