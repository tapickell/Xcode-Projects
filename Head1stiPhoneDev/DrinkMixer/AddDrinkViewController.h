//
//  AddDrinkViewController.h
//  DrinkMixer
//
//  Created by Todd Pickell on 2/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkDetailViewController.h"


@interface AddDrinkViewController : DrinkDetailViewController {
	BOOL keyboardVisible;
	NSMutableArray *drinkArray;

}
@property (nonatomic, retain) NSMutableArray* drinkArray;

- (void) keyboardDidShow: (NSNotification*) notif;
- (void) keyboardDidHide: (NSNotification*) notif;
- (IBAction) save: (id) sender;
- (IBAction) cancel: (id) sender;

@end
