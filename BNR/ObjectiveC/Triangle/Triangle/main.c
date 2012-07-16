//
//  main.c
//  Triangle
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

float remainAngle(float a, float b);

int main (int argc, const char * argv[])
{

    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainAngle(angleA, angleB);
    printf("The 3rd angle is %.2f\n", angleC);
    
    
    return 0;
}

float remainAngle(float a, float b)
{
    return 180.0 - (a + b);
}