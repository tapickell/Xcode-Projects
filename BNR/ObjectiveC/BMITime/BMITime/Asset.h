//
//  Asset.h
//  BMITime
//
//  Created by Todd Pickell on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Employee;

@interface Asset : NSObject

@property (strong) NSString *label;
@property unsigned int resaleValue;
@property (weak) Employee *holder;

@end
