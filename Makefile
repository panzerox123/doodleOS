.DEFAULT_GOAL := all
LD = ./toolchain/build-tools/bin/x86_64-elf-ld
CC = ./toolchain/build-tools/bin/x86_64-elf-gcc 
all: boot_object multiboot_header_obj std_obj kernel_obj kernel

kernel: out/boot.o out/multiboot.o out/std.o out/kernel.o kernel/linker.ld 
	@echo "Linker: Building kernel.bin"
	${LD} --script=kernel/linker.ld --output=out/iso/boot/kernel.bin --nmagic out/boot.o out/multiboot.o out/kernel.o out/std.o

boot_object: kernel/boot.asm
	@echo "Building boot.o"
	nasm -f elf64 kernel/boot.asm -o out/boot.o

multiboot_header_obj: kernel/multiboot_header.asm
	@echo "Building multiboot.o"
	nasm -f elf64 kernel/multiboot_header.asm -o out/multiboot.o

std_obj: kernel/std/print.c kernel/std/types.h kernel/std/print.h
	@echo "Building std.o"
	${CC} -c kernel/std/print.c -o out/std.o -ffreestanding -nostdlib

kernel_obj: kernel/kernel.c
	@echo "Building kernel.o"
	${CC} -c kernel/kernel.c -o out/kernel.o -ffreestanding -nostdlib

qemu_bootable: out/iso/boot/grub/grub.cfg out/iso/boot/kernel.bin
	@mkdir -p out/bootable
	grub-mkrescue -o out/bootable/qemu.iso out/iso

clean: 
	@echo "Cleaning out/"
	@rm -rf out/*.o out/bootable out/iso/boot/*.bin