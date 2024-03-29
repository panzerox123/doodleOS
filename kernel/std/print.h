#ifndef PRINT_H
#define PRINT_H 1

#include "types.h"

#define VIDEO_MEMORY 0xb8000

extern uint_16 * VIDEO_PTR;
extern uint_16 VGA_WIDTH;
extern uint_16 VGA_HEIGHT;

#define BG_BLACK 0x00
#define BG_BLUE 0x10
#define BG_GREEN 0x20
#define BG_CYAN 0x30
#define BG_RED 0x40
#define BG_MAGENTA 0x50
#define BG_BROWN 0x60
#define BG_BBLACK 0x80
#define BG_BBLUE 0x90
#define BG_BGREEN 0xA0
#define BG_BCYAN 0xB0
#define BG_BRED 0xC0
#define BG_BMAGENTA 0xD0
#define BG_BYELLOW 0xE0
#define BG_WHITE 0xF0

#define FG_BLACK 0x00
#define FG_BLUE 0x01
#define FG_GREEN 0x02
#define FG_CYAN 0x03
#define FG_RED 0x04
#define FG_MAGENTA 0x05
#define FG_BROWN 0x06
#define FG_LBLACK 0x08
#define FG_LBLUE 0x09
#define FG_LGREEN 0x0A
#define FG_LCYAN 0x0B
#define FG_LRED 0x0C
#define FG_LMAGENTA 0x0D
#define FG_YELLOW 0x0E
#define FG_WHITE 0x0F


void printc(const uint_8, const uint_8);
void print(const uint_8 *, const uint_8);
void cls(const uint_8);

#endif