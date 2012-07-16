//
//  main.m
//  myTimeInSeconds
//
//  Created by Todd Pickell on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDateComponents *comp = [[NSDateComponents alloc]init];
        
        [comp setYear:1977];
        [comp setMonth:10];
        [comp setDay:18];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dob = [g dateFromComponents:comp];
        
        NSDate *now = [[NSDate alloc]init];
        double diff = [now timeIntervalSinceDate:dob];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSUInteger day = [cal ordinalityOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:now];
        
        NSLog(@"Now it is: %@", now);
        NSLog(@"My dob is: %@", dob);
        NSLog(@"The difference in seconds is: %.2f", diff);
        NSLog(@"This is day %lu of the month", day);
        
        NSTimeZone *mine = [NSTimeZone systemTimeZone];
        Boolean dst = [mine isDaylightSavingTime];
        
        NSString *myString;
        
        if (dst) {
            myString = @" ";
        } else {
            myString= @" not ";
        }
        
        
        NSLog(@"It is%@daylight savings time", myString);
        
        
        NSHost *mySystem = [NSHost currentHost];
        NSString *myName = [mySystem localizedName];
        NSString *myAddress = [mySystem address];
        NSString *myInfo = [mySystem name];
        
        NSLog(@"localizedName: %@, address: %@, name: %@", myName, myAddress, myInfo);
        
        
    }
    return 0;
}

