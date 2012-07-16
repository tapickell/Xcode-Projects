//
//  Person.h
//  BMITime
//
//  Created by Todd Pickell on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    float heightInMeters;
    int weightInKilos;
}

@property float heightInMeters;
@property int weightInKilos;

-(float)bodyMassIndex;

@end
