    //
//  AddDrinkViewController.m
//  DrinkMixer
//
//  Created by Todd Pickell on 2/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddDrinkViewController.h"
#import "DrinkConstants.h"


@implementation AddDrinkViewController

@synthesize drinkArray;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"Registering for keyboard events");
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
		//initially keyboard is hidden, so reset our variable
	keyboardVisible = NO;
	if (self.drink != nil) {
		nameTextField.text = [self.drink objectForKey:NAME_KEY];
		ingredientsTextView.text = [self.drink objectForKey:INGREDIENTS_KEY];
		directionsTextView.text = [self.drink objectForKey:DIRECTIONS_KEY];
	}
}

- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"Unregistering for keyboard events");
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardDidShow:(NSNotification *)notif {
	NSLog(@"Recvd UIKeyboardDidShowNotification");
	if (keyboardVisible) {
		NSLog(@"Keyboard is already visible. Ignoring notification");
		return;
	}
		// the keyboard wasn't visible before
	NSLog(@"Resizing smaller for keyboard");
		// get the size of the keyboard
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
		// resize scroll view t make room for the keyboard
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height -= keyboardSize.height;
	scrollView.frame = viewFrame;
	keyboardVisible = YES;
}

- (void)keyboardDidHide:(NSNotification *)notif {
	NSLog(@"Recvd UIKeyboardDidHideNotification");
	if (!keyboardVisible) {
		NSLog(@"Keyboard already hidden. Ignoring notification.");
		return;
	}
		//the keyboard was visible
	NSLog(@"Resizing bigger with no keyboard");
		//get the size of the keyboard
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
		//reset the hieght of the scroll view t its orig value
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height += keyboardSize.height;
	scrollView.frame = viewFrame;
	keyboardVisible = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)] autorelease];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)] autorelease];
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
#pragma mark -
#pragma mark Save and Cancel

- (IBAction) save: (id) sender {
	NSLog(@"Save Pressed!");
	if (drink != nil) {
			//we're working with an existing drink, so lets remove
			//it from the array to get ready for a new one
		[drinkArray removeObject:drink];
		self.drink = nil; //this will release our reference too
	}
		//create a new drink dictionay for the new values
	NSMutableDictionary* newDrink = [[NSMutableDictionary alloc] init];
	[newDrink setValue:nameTextField.text forKey:NAME_KEY];
	[newDrink setValue:ingredientsTextView.text forKey:INGREDIENTS_KEY];
	[newDrink setValue:directionsTextView.text forKey:DIRECTIONS_KEY];
		//add it to the master drink array and release our reference
	[drinkArray addObject:newDrink];
	NSLog(@"New drink added to drinkArray");
	[newDrink release];
		//then sort it since the name might have changed
	NSSortDescriptor *nameSorter = [[NSSortDescriptor alloc] initWithKey:NAME_KEY ascending:YES selector:@selector(caseInsensitiveCompare:)];
	[drinkArray sortUsingDescriptors:[NSArray arrayWithObject:nameSorter]];
	[nameSorter release];
		//then pop the detailed view
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender {
	NSLog(@"Cancel Pressed!");
	[self dismissModalViewControllerAnimated:YES];
}


- (void)dealloc {
	[drinkArray release];
    [super dealloc];
}


@end
