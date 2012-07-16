//
//  Fugitive.h
//  iBountyHunter
//
//  Created by Dan Pilone on 10/24/09.
//  Copyright 2009 Dan Pilone All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Fugitive :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDecimalNumber * bounty;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * fugitiveID;
@property (nonatomic, retain) NSString * desc;

@end



