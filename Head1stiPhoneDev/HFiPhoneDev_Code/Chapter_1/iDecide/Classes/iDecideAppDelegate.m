//
//  iDecideAppDelegate.m
//  iDecide
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iDecideAppDelegate.h"
#import "iDecideViewController.h"

@implementation iDecideAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
