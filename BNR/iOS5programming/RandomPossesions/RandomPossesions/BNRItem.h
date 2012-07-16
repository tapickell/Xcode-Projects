//
//  BNRItem.h
//  RandomPossesions
//
//  Created by Todd Pickell on 6/13/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic) NSDate *dateCreated;


@end
