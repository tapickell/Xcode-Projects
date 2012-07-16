//
//  main.m
//  DateList
//
//  Created by Todd Pickell on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
         
        NSMutableArray *dateList = [NSMutableArray array];
        [dateList addObject:now];
        [dateList addObject:yesterday];
        [dateList addObject:tomorrow];
        
        NSLog(@"There are %lu dates", [dateList count]);
        
            //fast enumeration
        for (NSDate *d in dateList) {
            NSLog(@"Here is a date: %@", d);
        }
        
//        for (int i = 0; i < [dateList count]; i++) {
//            NSDate *d = [dateList objectAtIndex:i];
//            NSLog(@"Here is a date: %@", d);
//        }
                 
        
    }
    return 0;
}

