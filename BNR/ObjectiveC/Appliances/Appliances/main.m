//
//  main.m
//  Appliances
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        Appliance *a = [[Appliance alloc]init];
        NSLog(@"a is %@", a);
        [a setValue:@"Washing Machine" forKey:@"productName" ];
        [a setVoltage:240];
        NSLog(@"a is %@", a);
       
        NSLog(@"the product name is %@", [a valueForKey:@"productName"]);
        
        
    }
    return 0;
}

