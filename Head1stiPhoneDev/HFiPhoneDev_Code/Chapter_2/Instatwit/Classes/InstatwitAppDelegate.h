//
//  InstatwitAppDelegate.h
//  Instatwit
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InstatwitViewController;

@interface InstatwitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    InstatwitViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet InstatwitViewController *viewController;

@end

