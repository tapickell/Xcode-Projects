//
//  DrinkMixerAppDelegate.h
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

@interface DrinkMixerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

