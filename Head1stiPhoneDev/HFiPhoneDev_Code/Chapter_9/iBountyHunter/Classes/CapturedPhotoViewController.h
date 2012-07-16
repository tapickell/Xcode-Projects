//
//  CapturedPhotoViewController.h
//  iBountyHunter
//
//  Created by Dan Pilone on 10/25/09.
//  Copyright 2009 Dan Pilone All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Fugitive.h"


@interface CapturedPhotoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate> {
	UIImageView *fugitiveImage;
	MKMapView *fugitiveMapView;
	Fugitive *fugitive;
}

@property (nonatomic, retain) IBOutlet UIImageView *fugitiveImage;
@property (nonatomic, retain) IBOutlet MKMapView *fugitiveMapView;
@property (nonatomic, retain) Fugitive *fugitive;

- (IBAction) doneButtonPressed: (id) sender;
- (IBAction) takePictureButton: (id) sender;

@end
