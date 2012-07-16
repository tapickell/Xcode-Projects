//
//  InstatwitAppDelegate.m
//  Instatwit
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "InstatwitAppDelegate.h"
#import "InstatwitViewController.h"

@implementation InstatwitAppDelegate

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
