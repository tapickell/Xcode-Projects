//
//  main.c
//  FloatSize
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{

    float myFloat = 24.5;
    float *myPtr = &myFloat;
    
    printf("My float is %zu byte.\n", sizeof(myFloat));
    printf("My Pointer is %zu byte.\n", sizeof(myPtr));
    printf("A float is %zu byte.\n", sizeof(float));
    printf("A Pointer is %zu byte.\n", sizeof(float *));
    
    
    return 0;
}

