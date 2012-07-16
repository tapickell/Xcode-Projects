//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Todd Pickell on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore

    //overide init
-(id)init
{
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - singleton itemStore

+(BNRItemStore *)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

#pragma mark - class methods

-(NSArray *)allItems
{
    return allItems;
}

-(BNRItem *)createItem
{
    BNRItem *p = [BNRItem randomItem];
    [allItems addObject:p];
    return p;
}

-(void)removeItem:(BNRItem *)p
{
    [allItems removeObjectIdenticalTo:p];
}

-(void)moveItemAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }    
    //get pointer to object being moved
    BNRItem *p = [allItems objectAtIndex:from];
    //remove p from array
    [allItems removeObjectAtIndex:from];
    //insert p in index at new location
    [allItems insertObject:p atIndex:to];

}




@end
