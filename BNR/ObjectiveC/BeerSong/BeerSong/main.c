//
//  main.c
//  BeerSong
//
//  Created by Todd Pickell on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

void singTheSong(int numberOfBottles);

int main (int argc, const char * argv[])
{

    singTheSong(99);
    
    return 0;
}

void singTheSong(int numberOfBottles)
{
    if (numberOfBottles == 0) {
        printf("There are no more bottle(s) of beer on the wall.\n");
    } else {
        printf("%d bottle(s) of beer on the wall. %d bottle(s) of beer.\n", numberOfBottles, numberOfBottles);
        int oneFewer = numberOfBottles - 1;
        printf("Take one down, pass it around, %d bottle(s) of beer on the wall.\n", oneFewer);
        singTheSong(oneFewer);
        printf("Put a bottle in the recycling, %d bottle(s) in the bin.\n", numberOfBottles);
    }
}