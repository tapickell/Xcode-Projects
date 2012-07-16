//
//  AddDrinkViewController.h
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkDetailViewController.h"


@interface AddDrinkViewController : DrinkDetailViewController {
	BOOL keyboardVisible;
	NSMutableArray *drinkArray;
}

@property (nonatomic, retain) NSMutableArray* drinkArray;

-(void)keyboardDidShow:(NSNotification *)notif;
-(void)keyboardDidHide:(NSNotification *)notif;

-(IBAction) save:(id) sender;
-(IBAction) cancel:(id) sender;

@end
