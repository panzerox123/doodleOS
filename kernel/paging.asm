; Enabling Paging
mov eax, p3_table ; Enable p3_table and p4_table
or eax, 0b11
mov dword [p4_table], eax ; Copy p3 data into p4 
mov eax, p2_table
or eax, 0b11
mov dword [p3_table], eax

mov ecx, 0
.map_p2_table:
    mov eax, 0x200000
    mul ecx
    or eax, 0b10000011
    mov [p2_table + ecx * 8], eax
    inc ecx
    cmp ecx, 512
    jne .map_p2_table
; Moving page table to cr3
mov eax, p4_table
mov cr3, eax
; Enabling Physical address extension
mov eax, cr4
or eax, 1 << 5
mov cr4, eax
; Enabling Long Mode bit
mov ecx, 0xc0000080
rdmsr
or eax, 1 << 8
wrmsr
; Enable paging
mov eax, cr0
or eax, 1 << 31
or eax, 1 << 16
mov cr0, eax

section .bss
align 4096
p4_table:
    resb 4096
p3_table:
    resb 4096
p2_table:
    resb 4096
