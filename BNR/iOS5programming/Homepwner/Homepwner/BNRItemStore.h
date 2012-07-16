//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Todd Pickell on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
}

+(BNRItemStore *)sharedStore;

-(void)removeItem:(BNRItem *)p;
-(void)moveItemAtIndex:(int)from toIndex:(int)to;

-(NSArray *)allItems;
-(BNRItem *)createItem;

@end
