//
//  GorceryItem.h
//  Groceries
//
//  Created by Todd Pickell on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryItem : NSObject
{
    NSString *name;
    double price;    
}

-(void)setPrice:(float)p;
-(float)price;
-(void)setName:(NSString *)n;
-(NSString *)name;

@end
