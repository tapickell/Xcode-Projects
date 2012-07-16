//
//  Logger.h
//  Callbacks
//
//  Created by Todd Pickell on 6/10/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject {
    NSMutableData *incomingData;
}

-(void)sayOuch:(NSTimer *)t;

@end
