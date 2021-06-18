.DEFAULT_GOAL := all
LD = ../build-tools/target/bin/x86_64-elf-ld
CC = ../build-tools/target/bin/x86_64-elf-gcc
GC = ../build-tools/target/bin/x86_64-elf-gccgo
CC_FLAGS = -ffreestanding -nodefaultlibs -nostdlib
all: boot_object multiboot_header_obj std_obj kernel_obj kernel

kernel: out/boot.o out/multiboot.o out/std.o out/kernel.o kernel/linker.ld 
	@echo "Linker: Building kernel.bin"
	${LD} --script=kernel/linker.ld --output=out/iso/boot/kernel.bin --nmagic out/boot.o out/multiboot.o out/kernel.o out/std.o

boot_object: kernel/asm/boot.asm
	@echo "Building boot.o"
	nasm -f elf64 kernel/asm/boot.asm -o out/boot.o

multiboot_header_obj: kernel/asm/multiboot_header.asm
	@echo "Building multiboot.o"
	nasm -f elf64 kernel/asm/multiboot_header.asm -o out/multiboot.o

kernel_obj: kernel/kernel.c
	@echo "Building kernel.o"
	${CC} -c kernel/kernel.c -o out/kernel.o ${CC_FLAGS}

std_obj: kernel/std/print.c kernel/std/print.h kernel/std/types.h
	@echo "Building std.o"
	${CC} -c kernel/std/print.c -o out/std.o ${CC_FLAGS}

qemu_bootable: out/iso/boot/grub/grub.cfg out/iso/boot/kernel.bin
	@mkdir -p out/bootable
	grub-mkrescue -o out/bootable/qemu.iso out/iso

clean: 
	@echo "Cleaning out/"
	@rm -rf out/*.o out/bootable out/iso/boot/*.bin