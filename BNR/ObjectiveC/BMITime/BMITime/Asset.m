//
//  Asset.m
//  BMITime
//
//  Created by Todd Pickell on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset

@synthesize label;
@synthesize resaleValue;
@synthesize holder;

-(NSString *)description
{
    if ([self holder]) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@ >", [self label], [self resaleValue], [self holder]];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d >", [self label], [self resaleValue]];
    }
}

-(void)dealloc
{
    NSLog(@"deallocations %@", self);
}

@end
