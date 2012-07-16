//
//  main.m
//  TimeAfterTime
//
//  Created by Todd Pickell on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSDate *now = [NSDate date];
        double seconds = [now timeIntervalSince1970];
        NSDate *later = [now dateByAddingTimeInterval:100000];
    
        
        NSLog(@"The new date lives at %p", now);
        NSLog(@"The date is %@", now);
        NSLog(@"It has been %f seconds since Unix time start", seconds);
        NSLog(@"In 100,000 seconds it will be %@", later);

        
    }
    return 0;
}

