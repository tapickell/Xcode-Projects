//
//  ForeignStockHolding.h
//  Stocks
//
//  Created by Todd Pickell on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"

@interface ForeignStockHolding : StockHolding

@property float conversionRate;

-(id)initWithPurchasePrice: (float)purchasePrice andCurrentSharePrice: (float)currentPrice andNumberOfShares: (int)shares andStockName: (NSString *)name andConversionRate: (float)rate;

@end
