//
//  main.c
//  bitwize
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
    printf("Bitwise Operations\n");
    printf("\n");
    
    unsigned char a = 0x3c;
    unsigned char b = 0xa9;
    unsigned char c = a | b;
    unsigned char d = a & b;
    unsigned char e = a ^ b;
    unsigned char f = ~b;
    unsigned char g = a << 2;
    unsigned char h = a >> 1;
    
    printf("OR\n");
    printf("Hex: %x | %x = %x\n", a, b, c);
    printf("Decimal: %d | %d = %d\n", a, b, c);
    printf("\n");
    printf("AND\n");
    printf("Hex: %x & %x= %x\n", a, b, d);
    printf("Decimal: %d & %d = %d\n", a, b, d);
    printf("\n");
    printf("XOR\n");
    printf("Hex: %x ^ %x= %x\n", a, b, e);
    printf("Decimal: %d ^ %d = %d\n", a, b, e);
    printf("\n");
    printf("COMPLIMENT\n");
    printf("Hex: ~ %x= %x\n", b, f);
    printf("Decimal: ~ %d = %d\n", b, f);
    printf("\n");
    printf("LeftShift\n");
    printf("Hex: %x << 2 = %x\n", a, g);
    printf("Decimal: %d << 2 = %d\n", a, g);
    printf("\n");
    printf("RightShift\n");
    printf("Hex: %x >> 2 = %x\n", a, h);
    printf("Decimal: %d >> 2 = %d\n", a, h);
    
    return 0;
}

