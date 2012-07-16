//
//  main.c
//  TimeSince
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>
#include <time.h>


int main (int argc, const char * argv[])
{
    long secSince1970 = time(NULL);
    printf("Seconds Since 1970: %ld\n", secSince1970);
    long plus4bills = secSince1970 + 4000000;
    struct tm now;
    localtime_r(&secSince1970, &now);
    int year = now.tm_year + 1970;
    int month = now.tm_mon + 1;
    printf("The date in 4million seconds will be %d-%d-%d\n", month, now.tm_mday, year);

    
    return 0;
}

