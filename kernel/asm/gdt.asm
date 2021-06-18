section .rodata
gdt64:
    dq 0
.code: equ $ - gdt64
    dq (1<<44)|(1<<47)|(1<<41)|(1<<43)|(1<<53)

.data: equ $ - gdt64
    dq (1<<44)|(1<<47)|(1<<41)

.gdt_pointer:
    dw .gdt_pointer - gdt64 - 1
    dq gdt64