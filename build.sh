#!/bin/bash

# Assemble bootloader.asm
nasm -f bin bootloader.asm -o bootloader.bin

# Ensure bootloader.bin is exactly 512 bytes
dd if=/dev/zero of=bootloader_padded.bin bs=512 count=1
dd if=bootloader.bin of=bootloader_padded.bin conv=notrunc

# Combine bootloader and kernel into a single image
cat bootloader_padded.bin kernel.bin > bootable_image.bin

# Create bootable ISO image
genisoimage -o bootable_image.iso -b bootable_image.bin .
