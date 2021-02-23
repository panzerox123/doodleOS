global _start
section .text

bits 32

extern _main

_start:
    call _main
    cli
    hlt
    jmp $