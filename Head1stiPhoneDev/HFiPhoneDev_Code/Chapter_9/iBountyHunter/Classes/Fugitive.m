// 
//  Fugitive.m
//  iBountyHunter
//
//  Created by Dan Pilone on 10/25/09.
//  Copyright 2009 Dan Pilone All rights reserved.
//

#import "Fugitive.h"


@implementation Fugitive 

@dynamic bounty;
@dynamic capturedLat;
@dynamic captured;
@dynamic capturedLon;
@dynamic image;
@dynamic fugitiveID;
@dynamic captdate;
@dynamic desc;
@dynamic name;

- (CLLocationCoordinate2D) coordinate {
	CLLocationCoordinate2D captureCoord;
	captureCoord.latitude = [self.capturedLat doubleValue];
	captureCoord.longitude = [self.capturedLon doubleValue];
	
	return captureCoord;
}

- (NSString *) title {
	return self.name;
}

- (NSString *) subtitle {
	return self.desc;
}

@end
