.DEFAULT_GOAL := all
LD = ./toolchain/build-tools/bin/x86_64-elf-ld
CC = ./toolchain/build-tools/bin/x86_64-elf-gcc 
all: boot_object multiboot_header_obj kernel_obj kernel

kernel: out/boot.o out/multiboot.o out/kernel.o kernel/linker.ld
	@echo "Linker: Building kernel.bin"
	${LD} --script=kernel/linker.ld --output=out/iso/boot/kernel.bin --nmagic out/boot.o out/multiboot.o out/kernel.o

boot_object: kernel/boot.asm
	@echo "Building boot.o"
	nasm -f elf64 kernel/boot.asm -o out/boot.o

multiboot_header_obj: kernel/multiboot_header.asm
	@echo "Building multiboot.o"
	nasm -f elf64 kernel/multiboot_header.asm -o out/multiboot.o

kernel_obj: kernel/kernel.c kernel/types.h
	@echo "Building kernel.o"
	${CC} -c kernel/kernel.c -o out/kernel.o -ffreestanding -nostdlib

qemu_bootable: out/iso/boot/grub/grub.cfg out/iso/boot/kernel.bin
	@mkdir out/bootable
	grub-mkrescue -o out/bootable/qemu.iso out/iso

clean: 
	@echo "Cleaning out/"
	@rm -rf out/*.o out/bootable out/iso/boot/*.bin