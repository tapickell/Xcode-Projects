//
//  AddDrinkViewController.m
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AddDrinkViewController.h"


@implementation AddDrinkViewController


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
    [super dealloc];
}

#pragma mark -
#pragma mark Save and Cancel

-(IBAction) save: (id) sender {
	NSLog(@"Save pressed!");
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender {
	NSLog(@"Cancel pressed!");
	[self dismissModalViewControllerAnimated:YES];
}


@end
