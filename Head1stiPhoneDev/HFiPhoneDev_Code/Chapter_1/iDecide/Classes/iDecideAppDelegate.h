//
//  iDecideAppDelegate.h
//  iDecide
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
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

