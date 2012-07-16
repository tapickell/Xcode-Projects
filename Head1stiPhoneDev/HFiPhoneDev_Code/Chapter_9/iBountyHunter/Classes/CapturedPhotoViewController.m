//
//  CapturedPhotoViewController.m
//  iBountyHunter
//
//  Created by Dan Pilone on 10/25/09.
//  Copyright 2009 Dan Inc.. All rights reserved.
//

#import "CapturedPhotoViewController.h"


@implementation CapturedPhotoViewController

@synthesize fugitiveImage, fugitive, fugitiveMapView;


- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.fugitiveImage.image = [[[UIImage alloc] initWithData:fugitive.image] autorelease];
	
	if ([fugitive.captured boolValue] == YES) {
		CLLocationCoordinate2D mapCenter;
		mapCenter.latitude = [fugitive.capturedLat doubleValue];
		mapCenter.longitude = [fugitive.capturedLon doubleValue];
		
		MKCoordinateSpan mapSpan;
		mapSpan.latitudeDelta = 0.005;
		mapSpan.longitudeDelta = 0.005;
		
		MKCoordinateRegion mapRegion;
		mapRegion.center = mapCenter;
		mapRegion.span = mapSpan;
		
		self.fugitiveMapView.region = mapRegion;
		self.fugitiveMapView.mapType = MKMapTypeHybrid;
		
		[self.fugitiveMapView addAnnotation:self.fugitive];
	}
}

- (IBAction) doneButtonPressed: (id) sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) takePictureButton: (id) sender {
	NSLog(@"Taking picture.");
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		NSLog(@"This device has a camera, ask the what they want to do.");
		UIActionSheet *photoSourceSheet = [[UIActionSheet alloc] initWithTitle:@"Select Fugitive Picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take New Photo", @"Choose Existing Photo", nil, nil];
		[photoSourceSheet showInView:self.view];
		[photoSourceSheet release];
	}
	else { // No camera, probably a touch
		UIImagePickerController *picker = [[UIImagePickerController alloc] init];
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		picker.delegate = self;
		picker.allowsEditing = YES;
		[self presentModalViewController:picker animated:YES];
	}
}

- (void) actionSheet: (UIActionSheet *)actionSheet didDismissWithButtonIndex: (NSInteger)buttonIndex {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	
	switch (buttonIndex) {
		case 0:
			NSLog(@"User wants to take a new picture.");
			picker.sourceType = UIImagePickerControllerSourceTypeCamera;
			break;
		case 1:
			NSLog(@"User wants to use an existing photo.");
			picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
			break;
		default:
			// They picked cancel
			[picker release];
			return;
	}
	[self presentModalViewController:picker animated:YES];
}

- (void) imagePickerController: (UIImagePickerController *)picker didFinishPickingImage: (UIImage *)image 
				   editingInfo: (NSDictionary *)editingInfo {
	self.fugitive.image = UIImagePNGRepresentation(image);
	[self dismissModalViewControllerAnimated:YES];
	[picker release];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[self dismissModalViewControllerAnimated:YES];
	[picker release];
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
	[fugitiveImage release];
	[fugitive release];
	[fugitiveMapView release];
    [super dealloc];
}


@end
