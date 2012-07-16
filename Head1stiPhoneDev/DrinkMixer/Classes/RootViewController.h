//
//  RootViewController.h
//  DrinkMixer
//
//  Created by 7Pk13 on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSMutableArray* drinks;
	IBOutlet UIBarButtonItem *addButtonItem;
}
@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) UIBarButtonItem *addButtonItem;
- (IBAction) addButtonPressed: (id) sender;
- (void)applicationWillTerminate:(NSNotification *)notification;

@end
