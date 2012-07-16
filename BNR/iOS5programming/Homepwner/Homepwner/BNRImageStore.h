//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Todd Pickell on 6/24/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+(BNRImageStore *)sharedStore;

-(void)setImage:(UIImage *)i forKey:(NSString *)s;
-(UIImage *)imageForKey:(NSString *)s;
-(void)deleteImageForKey:(NSString *)s;

@end
