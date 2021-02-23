#include "std/print.h"

extern void _main(void)
{
    //init_term();
    //printc('H', BG_BGREEN | FG_WHITE);
    //printc('i', BG_BGREEN | FG_WHITE);
    cls(BG_RED | FG_CYAN);
    print("Hello World!", BG_RED|FG_WHITE);
    INF_LOOP
}