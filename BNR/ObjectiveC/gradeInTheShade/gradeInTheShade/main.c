//
//  main.c
//  gradeInTheShade
//
//  Created by Todd Pickell on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

float averageFloats(float *data, int dataCount)
{
    float sum = 0.0;
    for (int i = 0; i < dataCount; i++) {
        sum += data[i];
    }
    return sum / dataCount;
}

int main (int argc, const char * argv[])
{

    float gradeBook[3];
    gradeBook[0] = 60.2;
    gradeBook[1] = 94.5;
    gradeBook[2] = 81.1;
    
    float average = averageFloats(gradeBook, 3);
    
    
    printf("Average = %.2f\n", average);
    
    
    return 0;
}

