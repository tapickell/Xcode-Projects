//
//  iDecideViewController.m
//  iDecide
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iDecideViewController.h"

@implementation iDecideViewController
@synthesize decisionText;

-(IBAction)buttonPressed:(id)sender
{
	decisionText.text = @"Go for it!";
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
	[decisionText release];
    [super dealloc];
}

@end
