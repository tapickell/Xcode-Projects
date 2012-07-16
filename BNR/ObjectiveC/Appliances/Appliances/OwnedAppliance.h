//
//  OwnedAppliance.h
//  Appliances
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Appliance.h"

@interface OwnedAppliance : Appliance {
    NSMutableSet *ownerNames;
}

    //the designated initializer
-(id)initWithProductName:(NSString *)pn firstOwner:(NSString *)n;
-(void)assOwnerNamesObject:(NSString *)n;
-(void)removeOwnerNamesObject:(NSString *)n;

@end
