//
//  StockHolding.h
//  Stocks
//
//  Created by Todd Pickell on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockHolding : NSObject

@property (assign, readwrite) NSString *stockName;
@property float purchaseSharePrice;
@property float currentSharePrice;
@property int numberOfShares;

-(id)initWithPurchasePrice: (float)purchasePrice andCurrentSharePrice: (float)currentPrice andNumberOfShares: (int)shares andStockName: (NSString *)name;

-(float)constInDollars;
-(float)valueInDollars;

@end
