//
//  BNRViewController.h
//  WhereAmI
//
//  Created by Todd Pickell on 6/14/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;


@end


