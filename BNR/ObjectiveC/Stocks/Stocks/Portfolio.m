//
//  Portfolio.m
//  Stocks
//
//  Created by Todd Pickell on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Portfolio.h"

@implementation Portfolio

-(id)init
{
    myStocks = [[NSMutableArray alloc] init];
    return self;
}

-(void)addStockToPortfolio:(StockHolding *)newStock
{
    [myStocks addObject:newStock];
}

-(void)addForiegnStockToPortfolio:(ForeignStockHolding *)newForiegnStock
{
    [myStocks addObject:newForiegnStock];
}

-(void)stockPrintout
{
    NSLog(@"Current number of stocks: %lu", [myStocks count]);
    NSLog(@"Printing currents stocks in portfolio");
    for (int i = 0; i < [myStocks count]; i++) {
        NSLog(@"%@", [myStocks objectAtIndex:i]);
    }
}

-(float)getCurrentPortfolioValue
{
    float values;
    for (int i = 0; i < [myStocks count]; i++) {
        values += [[myStocks objectAtIndex:i] valueInDollars];
    }
    return values;
}

@end
