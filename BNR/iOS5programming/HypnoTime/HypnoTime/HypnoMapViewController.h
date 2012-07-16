//
//  HypnoMapViewController.h
//  HypnoTime
//
//  Created by Todd Pickell on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface HypnoMapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    __weak IBOutlet MKMapView *worldView;
}

@end
