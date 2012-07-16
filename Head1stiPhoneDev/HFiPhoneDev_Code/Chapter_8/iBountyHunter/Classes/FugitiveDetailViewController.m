//
//  FugitiveDetailViewController.m
//  iBountyHunter
//
//  Created by Dan Pilone on 10/24/09.
//  Copyright 2009 Dan Pilone. All rights reserved.
//

#import "FugitiveDetailViewController.h"
#import "Fugitive.h"


@implementation FugitiveDetailViewController

@synthesize fugitive, fugitiveNameLabel, fugitiveIdLabel, fugitiveDescriptionView, fugitiveBountyLabel,
			capturedDateLabel, capturedToggle;

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	fugitiveNameLabel.text = fugitive.name;
	fugitiveIdLabel.text = [fugitive.fugitiveID stringValue];
	fugitiveDescriptionView.text = fugitive.desc;
	fugitiveBountyLabel.text = [fugitive.bounty stringValue];
	capturedDateLabel.text = [fugitive.captdate description];
	capturedToggle.selectedSegmentIndex = [fugitive.captured boolValue] ? 0 : 1;
}
	
- (IBAction) capturedToggleChanged: (id) sender {
	if (capturedToggle.selectedSegmentIndex == 0) {
		NSDate *now = [NSDate date];
		fugitive.captdate = now;
		fugitive.captured = [NSNumber numberWithBool:YES];
	}
	else {
		fugitive.captdate = nil;
		fugitive.captured = [NSNumber numberWithBool:NO];
	}
	
	capturedDateLabel.text = [fugitive.captdate description];
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
	[fugitive release];
	[fugitiveNameLabel release];
	[fugitiveIdLabel release];
	[fugitiveDescriptionView release];
	[fugitiveBountyLabel release];
	[capturedDateLabel release];
	[capturedToggle release];
    [super dealloc];
}


@end
