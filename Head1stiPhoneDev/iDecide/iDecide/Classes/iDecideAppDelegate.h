//
//  iDecideAppDelegate.h
//  iDecide
//
//  Created by Todd Pickell on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iDecideViewController;

@interface iDecideAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iDecideViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iDecideViewController *viewController;

@end

