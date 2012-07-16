//
//  Portfolio.h
//  Stocks
//
//  Created by Todd Pickell on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"
#import "ForeignStockHolding.h"

@interface Portfolio : NSObject
{
    NSMutableArray *myStocks;
}

-(void)addStockToPortfolio:(StockHolding *)newStock;
-(void)addForiegnStockToPortfolio:(ForeignStockHolding *)newForiegnStock;
-(float)getCurrentPortfolioValue;

-(void)stockPrintout;

@end
