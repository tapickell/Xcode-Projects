//
//  FugitiveDetailViewController.h
//  iBountyHunter
//
//  Created by Dan Pilone on 10/24/09.
//  Copyright 2009 Dan Pilone All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class Fugitive;

@interface FugitiveDetailViewController : UIViewController <CLLocationManagerDelegate> {
	Fugitive *fugitive;
	UILabel *fugitiveNameLabel;
	UILabel *fugitiveIdLabel;
	UITextView *fugitiveDescriptionView;
	UILabel *fugitiveBountyLabel;
	UISegmentedControl *capturedToggle;
	UILabel *capturedDateLabel;
	UILabel *capturedLatLon;
	
	CLLocationManager *locationManager;
}

@property (nonatomic, retain) Fugitive *fugitive;
@property (nonatomic, retain) IBOutlet UILabel *fugitiveNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *fugitiveIdLabel;
@property (nonatomic, retain) IBOutlet UITextView *fugitiveDescriptionView;
@property (nonatomic, retain) IBOutlet UILabel *fugitiveBountyLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *capturedToggle;
@property (nonatomic, retain) IBOutlet UILabel *capturedDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *capturedLatLon;
@property (nonatomic, retain) CLLocationManager *locationManager;

- (IBAction) capturedToggleChanged: (id) sender;
- (IBAction) showInfoButtonPressed: (id) sender;

@end
