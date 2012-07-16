//
//  main.c
//  MallocMyCowlick
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main (int argc, const char * argv[])
{
    float *startOfBuffer;
    
    startOfBuffer = malloc(1000 * sizeof(float));
    
    free(startOfBuffer);
    
    startOfBuffer = NULL;
    
    
    return 0;
}

