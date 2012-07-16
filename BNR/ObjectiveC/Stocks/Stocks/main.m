//
//  main.m
//  Stocks
//
//  Created by Todd Pickell on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"
#import "ForeignStockHolding.h"
#import "Portfolio.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        StockHolding *stock1 = [[StockHolding alloc] initWithPurchasePrice:2.3 andCurrentSharePrice:4.5 andNumberOfShares:40 andStockName:@"Exxon"];
        StockHolding *stock2 = [[StockHolding alloc] initWithPurchasePrice:12.19 andCurrentSharePrice:10.56 andNumberOfShares:90 andStockName:@"Intel"];
        StockHolding *stock3 = [[StockHolding alloc] initWithPurchasePrice:45.10 andCurrentSharePrice:49.51 andNumberOfShares:210 andStockName:@"Apple"];
        
        ForeignStockHolding *fstock1 = [[ForeignStockHolding alloc] initWithPurchasePrice:2.3 andCurrentSharePrice:4.5 andNumberOfShares:40 andStockName:@"Alli Babba Oil" andConversionRate:0.94];
        
        Portfolio *myPortfolio = [[Portfolio alloc] init];
        
        [myPortfolio addStockToPortfolio:stock1];
        [myPortfolio addStockToPortfolio:stock2];
        [myPortfolio addStockToPortfolio:stock3];
        [myPortfolio addForiegnStockToPortfolio:fstock1];
        [myPortfolio stockPrintout];
        
        NSLog(@"My portfolios current value: $%.2f", [myPortfolio getCurrentPortfolioValue]);
        

        
    }
    return 0;
}

