out/kernel.bin: out/boot.o out/multiboot.o out/kernel.o kernel/linker.ld
	./toolchain/build-tools/bin/x86_64-elf-ld --script=kernel/linker.ld --output=out/kernel.bin --nmagic out/boot.o out/multiboot.o out/kernel.o

out/boot.o: kernel/boot.asm
	nasm -f elf64 kernel/boot.asm -o out/boot.o

out/multiboot.o: kernel/multiboot_header.asm
	nasm -f elf64 kernel/multiboot_header.asm -o out/multiboot.o

out/kernel.o: kernel/kernel.c kernel/types.h
	./toolchain/build-tools/bin/x86_64-elf-gcc -c kernel/kernel.c -o out/kernel.o -ffreestanding -nostdlib

