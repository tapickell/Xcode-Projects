//
//  Appliance.m
//  Appliances
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Appliance.h"

@implementation Appliance

@synthesize productName, voltage;

# pragma mark - init overrides

-(id)init
{
    return [self initWithProductName:@"Unknown"];
}

-(id)initWithProductName:(NSString *)pn
{
        //call NSObjects init
    self = [super init];
    
    if (self) {
            //set product name
        [self setProductName:pn];
        
            //give starting value for voltage
        [self setVoltage:120];
    }
    
        //return a pointer to the new object
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", productName, voltage];
}


@end
