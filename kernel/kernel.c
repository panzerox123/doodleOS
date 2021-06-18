#include "std/print.h"

extern void _main(void)
{
    cls(BG_RED | FG_CYAN);
    print("Hello World!", BG_RED|FG_WHITE);
    INF_LOOP
}