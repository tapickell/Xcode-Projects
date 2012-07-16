//
//  main.c
//  Turkey
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
    float weight;
    
    weight = 14.2;
    
    printf("The turkey weighs %f. \n", weight);
    
    float cookingTime;
    
    cookingTime = 15.0 + 15.0 * weight;
    
    printf("Cook it for %f minutes.\n", cookingTime);

    // insert code here...
    printf("Hello, World!\n");
    return 0;
}

