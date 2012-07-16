//
//  AddDrinkViewController.m
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AddDrinkViewController.h"
#import "DrinkConstants.h"


@implementation AddDrinkViewController

@synthesize drinkArray;

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"Registering for keyboard events");
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
												 name: UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
												 name: UIKeyboardDidHideNotification object:nil];
	
	//Initially the keyboard is hidden, so reset our variable 
	keyboardVisible = NO;
	
	if (self.drink !=nil) {
		nameTextField.text = [self.drink objectForKey:NAME_KEY];
		ingredientsTextView.text = [self.drink objectForKey:INGREDIENTS_KEY];
		directionsTextView.text = [self.drink objectForKey:DIRECTIONS_KEY];
	}
}

-(void) viewWillDisappear:(BOOL)animated {
	NSLog (@"Unregsitering for keyboard events");
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) keyboardDidShow: (NSNotification *)notif {
	if (keyboardVisible) {
		NSLog(@"Keyboard is already visible. Ignoring notofication.");
		return;
	}
	
	//The keyboard wasn't visible before
	NSLog(@"Resizing smaller for keyboard");
	
	// Get the size of the keyboard.
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	
	// Resize the scroll view to make room for the keyboard
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height -= keyboardSize.height;
	scrollView.frame = viewFrame;
	keyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif {
	if (!keyboardVisible) {
		NSLog(@"Keyboard is already hidden. Ignoring notification.");
		return;
	}
	
	// The keyboard was visible
	NSLog (@"Resizing bigger with no keyboard");
	
	//Get the size of the keyboard.
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	
	// Reset the height of the scroll view to its original value
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height += keyboardSize.height;
	
	scrollView.frame = viewFrame;
	keyboardVisible = NO;
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)] autorelease];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)] autorelease];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[drinkArray release];
    [super dealloc];
}

#pragma mark -
#pragma mark Save and Cancel

-(IBAction) save: (id) sender {
	NSLog(@"Save pressed!");
	
	if (drink != nil) {
		// We're working with an exisitng drink, so let's remove
		// it from the array to get ready for a new one
		[drinkArray removeObject:drink];
		self.drink = nil; //This will release our reference too
	}
	
	// Create a new drink dictionary for the new values
	NSMutableDictionary* newDrink = [[NSMutableDictionary alloc] init];
	[newDrink setValue:nameTextField.text forKey:NAME_KEY];
	[newDrink setValue:ingredientsTextView.text forKey:INGREDIENTS_KEY];
	[newDrink setValue:directionsTextView.text forKey:DIRECTIONS_KEY];
	
	// Add it to the master drink array and release our reference
	[drinkArray addObject:newDrink];
	[newDrink release];
	
	// Sort the array since we just aded a new drink
	NSSortDescriptor *nameSorter = [[NSSortDescriptor alloc] initWithKey:NAME_KEY ascending:YES selector:@selector(caseInsensitiveCompare:)];
	[drinkArray sortUsingDescriptors:[NSArray arrayWithObject:nameSorter]];
	[nameSorter release];
	
	// Then pop the detailed view
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender {
	NSLog(@"Cancel pressed!");
	[self dismissModalViewControllerAnimated:YES];
}


@end
