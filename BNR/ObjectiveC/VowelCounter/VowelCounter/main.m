//
//  main.m
//  VowelCounter
//
//  Created by Todd Pickell on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+VowelCounting.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *string = @"Hello, World!";
        NSLog(@"%@ has %d vowels", string, [string vowelCount]);
        
    }
    return 0;
}

