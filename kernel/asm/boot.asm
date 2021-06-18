global _start
section .text

bits 32

_start:
    %include "kernel/asm/paging.asm"
    section .text
    ; Load GDT
    lgdt [gdt64.gdt_pointer]
    mov ax, gdt64.data
    mov ss, ax
    mov ds, ax
    mov es, ax
    jmp gdt64.code:long_mode_start

%include "kernel/asm/gdt.asm"

bits 64

long_mode_start:
    extern _main
    call _main
    hlt
    jmp $