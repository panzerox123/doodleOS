section .multiboot_header
multiboot_header_start:
    dd 0xe85250d6
    dd 0
    ; Header length
    dd multiboot_header_end - multiboot_header_start
    ; Checksum
    dd 0x100000000 - (0xe85250d6 + 0 + (multiboot_header_end - multiboot_header_start))

    dw 0
    dw 0
    dd 8
multiboot_header_end:

