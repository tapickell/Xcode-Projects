//
//  OwnedAppliance.m
//  Appliances
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OwnedAppliance.h"

@implementation OwnedAppliance

-(id)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwner:nil];
}

-(id)initWithProductName:(NSString *)pn firstOwner:(NSString *)n
{
        //call super init
    self = [super initWithProductName:pn];
    
    if (self) {
            //create set to hold names
        ownerNames = [[NSMutableSet alloc] init];
        
        if (n) {
                //if not nil add names to set
            [ownerNames addObject:n];
        }
    }
    
        //return pointer to new object
    return self;
}

-(void)addOwnerNamesObject:(NSString *)n
{
    [ownerNames addObject:n];
}

-(void)removeOwnerNamesObject:(NSString *)n
{
    [ownerNames removeObject:n];
}

@end
