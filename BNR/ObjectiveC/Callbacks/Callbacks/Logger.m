//
//  Logger.m
//  Callbacks
//
//  Created by Todd Pickell on 6/10/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import "Logger.h"

@implementation Logger

-(void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch!");
}

    //called each time a chunk of data arrives
-(void)connection:(NSURLConnection *)connection
   didReceiveData:(NSData *)data
{
    NSLog(@"recieved %lu bytes", [data length]);
    
        //create mutableData if not done yet
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

    //called when last chunk processed
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    
    NSString * string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    
    incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);
}

    //called if fetch fails
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"connection failed %@", [error localizedDescription]);
    incomingData = nil;
}

    //called when time zone changes
-(void)zoneChange:(NSNotificationCenter *)note
{
    NSLog(@"The system time zone has changed.");
}
@end
