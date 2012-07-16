//
//  Appliance.h
//  Appliances
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appliance : NSObject {
    NSString *productName;
    int voltage;
}

@property (copy, nonatomic) NSString *productName;
@property (nonatomic) int voltage;

    //the designated initializer
-(id)initWithProductName:(NSString *)pn;

@end
