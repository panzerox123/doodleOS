#include "print.h"


uint_16 * VIDEO_PTR = (uint_16 *)VIDEO_MEMORY;
uint_16 VGA_WIDTH = 80;
uint_16 VGA_HEIGHT = 25;

void printc(const uint_8 ch, uint_8 color){
    *(VIDEO_PTR++) = (color << 8) | ch;  
}

void print(const uint_8 * str, uint_8 color){
    uint_8 * temp = str;
    while(*temp!='\0'){
        printc(*temp, color);
        temp++;
    }
}

void cls(uint_8 color){
    VIDEO_PTR = (uint_16 *) VIDEO_MEMORY;
    uint_64 * TEMP_VID_PTR = (uint_64 *) VIDEO_MEMORY;
    uint_64 blank = (color << 8) | ' ';
    int i = 0;
    for(i = 0; i<3; i++){
        blank = blank << 16;
        blank |= (color << 8) | ' ';
    }
    for(int i = 0; i<500;i++){
        *(TEMP_VID_PTR+i) = blank;
    }
}