//
//  main.m
//  Groceries
//
//  Created by Todd Pickell on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroceryItem.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        GroceryItem *carrots = [[GroceryItem alloc] init];
        GroceryItem *peas = [[GroceryItem alloc] init];
        GroceryItem *pineapple = [[GroceryItem alloc] init];
        
        [peas setName:@"peas"];
        [carrots setName:@"carrots"];
        [pineapple setName:@"pineapple"];
        [peas setPrice:2.92];
        [carrots setPrice:1.19];
        [pineapple setPrice:3.11];
        
        NSMutableArray *groceryList = [NSMutableArray array];
        [groceryList addObject:carrots];
        [groceryList addObject:peas];
        [groceryList addObject:pineapple];
        
        for (GroceryItem *item in groceryList) {
            NSLog(@"Dont forget the %@", item);
        }
        
        
    }
    return 0;
}

