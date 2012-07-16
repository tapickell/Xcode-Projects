//
//  ForeignStockHolding.m
//  Stocks
//
//  Created by Todd Pickell on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ForeignStockHolding.h"

@implementation ForeignStockHolding

@synthesize conversionRate;

-(id)initWithPurchasePrice: (float)purchasePrice andCurrentSharePrice: (float)currentPrice andNumberOfShares: (int)shares andStockName: (NSString *)name andConversionRate: (float)rate
{
    if (self = [super init]) {
        [self setPurchaseSharePrice:purchasePrice];
        [self setCurrentSharePrice:currentPrice];
        [self setNumberOfShares:shares];
        [self setStockName:name];
        [self setConversionRate:rate];
    }
    return self;
}

-(float)costInDollars
{
    return [super constInDollars] * conversionRate;
}

-(float)valueInDollars
{
    return [super valueInDollars] * conversionRate;
}

@end
