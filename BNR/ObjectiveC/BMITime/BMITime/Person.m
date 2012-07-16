//
//  Person.m
//  BMITime
//
//  Created by Todd Pickell on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize heightInMeters, weightInKilos;

-(float)bodyMassIndex
{
    return weightInKilos / (heightInMeters * heightInMeters);
}

@end
