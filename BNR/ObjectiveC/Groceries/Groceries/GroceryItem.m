//
//  GorceryItem.m
//  Groceries
//
//  Created by Todd Pickell on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GroceryItem.h"

@implementation GroceryItem

-(NSString *)description
{
    NSString *myString = [NSString stringWithFormat:@"%@ : $%.2f", name, price];
    return myString;
}

-(void)setPrice:(float)p
{
    price = p;
}

-(float)price
{
    return price;
}

-(void)setName:(NSString *)n
{
    name = n;
}

-(NSString *)name
{
    return name;
}

@end
