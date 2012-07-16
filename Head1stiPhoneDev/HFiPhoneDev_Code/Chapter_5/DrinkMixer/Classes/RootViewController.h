//
//  RootViewController.h
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

@interface RootViewController : UITableViewController {
	NSMutableArray* drinks;
	IBOutlet UIBarButtonItem *addButtonItem;
}

@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) UIBarButtonItem *addButtonItem;

-(IBAction) addButtonPressed: (id)sender;

@end
