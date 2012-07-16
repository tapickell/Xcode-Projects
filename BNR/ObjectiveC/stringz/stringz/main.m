//
//  main.m
//  stringz
//
//  Created by Todd Pickell on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *myPath = @"/tmp/cool.txt";
        
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Todd is cool!\n"];
        }
        
        NSError *error = nil;
        
        BOOL success = [str writeToFile:myPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if (success) {
            NSLog(@"done writing %@", myPath);
        } else {
            NSLog(@"writing %@ failed: %@", myPath, [error localizedDescription]);
        }
        
        NSString *strIn = [[NSString alloc] initWithContentsOfFile:myPath encoding:NSASCIIStringEncoding error:&error];
        
        if (!strIn) {
            NSLog(@"read failed: %@", strIn);
        } else {
            NSLog(@"%@ looks like this: %@", myPath, strIn);
        }
        
    }
    return 0;
}

