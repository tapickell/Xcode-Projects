//
//  FugitiveDetailViewController.m
//  iBountyHunter
//
//  Created by Dan Pilone on 10/24/09.
//  Copyright 2009 Dan Pilone. All rights reserved.
//

#import "FugitiveDetailViewController.h"
#import "Fugitive.h"
#import "CapturedPhotoViewController.h"


@implementation FugitiveDetailViewController

@synthesize fugitive, fugitiveNameLabel, fugitiveIdLabel, fugitiveDescriptionView, fugitiveBountyLabel,
	capturedDateLabel, capturedToggle, capturedLatLon, locationManager;

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	fugitiveNameLabel.text = fugitive.name;
	fugitiveIdLabel.text = [fugitive.fugitiveID stringValue];
	fugitiveDescriptionView.text = fugitive.desc;
	fugitiveBountyLabel.text = [fugitive.bounty stringValue];
	capturedDateLabel.text = [fugitive.captdate description];
	capturedToggle.selectedSegmentIndex = [fugitive.captured boolValue] ? 0 : 1;
	capturedLatLon.text = [NSString stringWithFormat:@"%.3f, %.3f", [fugitive.capturedLat doubleValue],
						   [fugitive.capturedLon doubleValue]];
	
	self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
	self.locationManager.delegate = self;
	[self.locationManager startUpdatingLocation];
}

- (void) viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
	NSLog(@"Shutting down Core Location");
	[self.locationManager stopUpdatingLocation];
	self.locationManager = nil;
}
	
- (IBAction) capturedToggleChanged: (id) sender {
	if (capturedToggle.selectedSegmentIndex == 0) {
		NSDate *now = [NSDate date];
		fugitive.captdate = now;
		fugitive.captured = [NSNumber numberWithBool:YES];
		CLLocation *curPos = self.locationManager.location;
		fugitive.capturedLat = [NSNumber numberWithDouble:curPos.coordinate.latitude];
		fugitive.capturedLon = [NSNumber numberWithDouble:curPos.coordinate.longitude];
	}
	else {
		fugitive.captdate = nil;
		fugitive.captured = [NSNumber numberWithBool:NO];
		fugitive.capturedLat = nil;
		fugitive.capturedLon = nil;
	}
	
	capturedDateLabel.text = [fugitive.captdate description];
	capturedLatLon.text = [NSString stringWithFormat:@"%.3f, %.3f", 
						   [fugitive.capturedLat doubleValue], 
						   [fugitive.capturedLon doubleValue]];
}

- (void) locationManager: (CLLocationManager *)manager didUpdateToLocation: (CLLocation *)newLocation
			fromLocation: (CLLocation *)oldLocation {
	NSLog(@"Core Location claims to have a position.");
	capturedToggle.enabled = YES;
}

- (void) locationManager: (CLLocationManager *)manager didFailWithError: (NSError *)error {
	NSLog(@"Core location says no-go on the position info.");
	capturedToggle.enabled = NO;
}


- (IBAction) showInfoButtonPressed: (id) sender {
	CapturedPhotoViewController *controller = [[CapturedPhotoViewController alloc] initWithNibName:@"CapturedPhotoViewController" bundle:nil];
	controller.fugitive = fugitive;
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	[controller release];
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
	[capturedLatLon release];
	[locationManager release];
    [super dealloc];
}


@end
