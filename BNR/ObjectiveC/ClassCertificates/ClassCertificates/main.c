//
//  main.c
//  ClassCertificates
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

void congratulateStudent(char *student, char *course, int numDays);

int main (int argc, const char * argv[])
{
    congratulateStudent("Mark", "Cocoa", 5);
    congratulateStudent("Bob", "Objective-C", 2);
    
    return 0;
}

void congratulateStudent(char *student, char *course, int numDays)
{
    printf("%s has done as much %s Programming as could be fit into %d days.\n", student, course, numDays);
}