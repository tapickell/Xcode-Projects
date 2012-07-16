//
//  main.c
//  mallocMyBMI
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct {
    float heightInMeters;
    float weightInKilos;
} Person;

float bodyMassIndex(Person *p);

int main (int argc, const char * argv[])
{

    Person *x = (Person *)malloc(sizeof(Person));
    
    x->weightInKilos = 81;
    x->heightInMeters = 2.0;
    
    float xBMI = bodyMassIndex(x);
    
    printf("X has BMI + %f\n", xBMI);
    
    free(x);
    
    x = NULL;
      
    return 0;
}

float bodyMassIndex(Person *p)
{
    return p->weightInKilos / (p->heightInMeters * p->heightInMeters);
}