#include "types.h"

extern void _main(void)
{
    uint_16 *display_pointer = (uint_16 *)0xb8000;
    *display_pointer = (0xF0 << 8) | 'H';
    *(display_pointer+1) = (0x3F << 8) | 'E';
    *(display_pointer+2) = (0xF0 << 8) | 'L';
    *(display_pointer+3) = (0xF0 << 8) | 'L';
    *(display_pointer+4) = (0xF0 << 8) | '0';
    INF_LOOP
}