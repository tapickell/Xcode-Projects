//
//  BNRViewController.m
//  WhereAmI
//
//  Created by Todd Pickell on 6/14/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import "BNRViewController.h"
#import "BNRMapPoint.h"

@interface BNRViewController ()

@end

@implementation BNRViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    return self;
}

#pragma mark - Location Manager

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation 
          fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", newLocation);
        //how many seconds old is this location
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
        //if location is more than 3 minutes old ignore it
    if (t < -180) {
            //this is cached data, we don't want it
        return;
    }
    [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager 
       didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"Heading: %@", newHeading);
}

-(void)locationManager:(CLLocationManager *)manager 
      didFailWithError:(NSError *)error
{
    NSLog(@"could not find location: %@", error);
}

-(void)dealloc
{
    [locationManager setDelegate:nil];
}

#pragma mark - Map View

-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
        //this is where we zoom
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
    
}

#pragma mark - Location Methods

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
    
}

-(void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord 
                                                        title:[locationTitleField text]];
    [worldView addAnnotation:mp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
        //reset ui
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

#pragma mark - Text Field

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

@end
