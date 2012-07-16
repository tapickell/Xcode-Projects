//
//  DrinkDetailViewController.m
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DrinkDetailViewController.h"


@implementation DrinkDetailViewController
@synthesize nameTextField, ingredientsTextView, directionsTextView;

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
	[nameTextField release];
	[ingredientsTextView release];
	[directionsTextView release];
    [super dealloc];
}


@end
