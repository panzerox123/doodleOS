#!/bin/sh
make
make qemu_bootable
qemu-system-x86_64 out/bootable/qemu.iso
