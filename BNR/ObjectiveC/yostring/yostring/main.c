//
//  main.c
//  yostring
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, const char * argv[])
{

    char x = '!';
    
    while (x <= '~') {
        printf("%x is %c\n", x, x);
        x++;
    }
    
    char *start = "A person who never made a mistake never tried anything new.";
    
    char z = 0x20;
    int sum = 0;
    for (int i = 0; i < strlen(start); i ++) {
        if (start[i] == z) {
            sum++;
        }
    }
    
    printf("\n");
    printf("\"%s\" \nHas %zu characters\n", start, strlen(start));
    printf("The third character is %c\n", start[2]);
    printf("There are %d spaces in this quote\n", sum);   
    
    return 0;
}

