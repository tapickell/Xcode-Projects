//
//  main.c
//  Affirmation
//
//  Created by Todd Pickell on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{

    if (argc != 3) {
        fprintf(stderr, "Usage: Affirmation <name> <number>\n");
        return 1;
    }
    
    int count = atoi(argv[2]);
    for (int i = 0; i < count; i++) {
        printf("%s is Awesome!\n", argv[i]);
    }
    return 0;
}

