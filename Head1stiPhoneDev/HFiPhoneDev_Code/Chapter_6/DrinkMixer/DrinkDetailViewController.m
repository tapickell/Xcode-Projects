//
//  DrinkDetailViewController.m
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"


@implementation DrinkDetailViewController
@synthesize drink, nameTextField, ingredientsTextView, directionsTextView, scrollView;

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	nameTextField.text = [drink objectForKey:NAME_KEY];
	ingredientsTextView.text = [drink objectForKey:INGREDIENTS_KEY];
	directionsTextView.text = [drink objectForKey:DIRECTIONS_KEY];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	scrollView.contentSize = self.view.frame.size;
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
	[scrollView release];
	[nameTextField release];
	[ingredientsTextView release];
	[directionsTextView release];
	[drink release];
    [super dealloc];
}


@end
