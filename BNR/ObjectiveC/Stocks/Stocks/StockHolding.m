//
//  StockHolding.m
//  Stocks
//
//  Created by Todd Pickell on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StockHolding.h"

@implementation StockHolding

@synthesize stockName;
@synthesize purchaseSharePrice, currentSharePrice, numberOfShares;

-(id)initWithPurchasePrice: (float)purchasePrice andCurrentSharePrice: (float)currentPrice andNumberOfShares: (int)shares andStockName: (NSString *)name
{
    if (self = [super init]) {
        [self setPurchaseSharePrice:purchasePrice];
        [self setCurrentSharePrice:currentPrice];
        [self setNumberOfShares:shares];
        [self setStockName:name];
    }
    return self;
}

-(NSString *)description
{
    NSString *myString = [NSString stringWithFormat:@"Stock Name: %@ Purchase Price: $%.2f Current Value: $%.2f Shares: %d Value: $%.2f", stockName, purchaseSharePrice, currentSharePrice, numberOfShares, [ self valueInDollars ]];
    return myString;
}

-(float)constInDollars
{
    return purchaseSharePrice * numberOfShares;
}

-(float)valueInDollars
{
    return currentSharePrice * numberOfShares;
}

@end
