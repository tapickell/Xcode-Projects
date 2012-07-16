//
//  main.c
//  BMICalc
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;

float bodyMassIndex(Person p);

int main (int argc, const char * argv[])
{
    Person person;
    person.weightInKilos = 96;
    person.heightInMeters = 1.8;
    float bmi = bodyMassIndex(person);
    
    printf("Person weighs %i kilos and is %.2f meters tall and has a BMI index of %.2f.\n", person.weightInKilos, person.heightInMeters, bmi);
    
    return 0;
}

float bodyMassIndex(Person p)
{
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}