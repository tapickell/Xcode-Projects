//
//  MyController.m
//
//  Created by Todd Pickell on 1/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyController.h"

@implementation MyController
- (IBAction)changeLabelText:(id)sender {
    
	int sliderValue = slider.value;
	label.text = [NSString stringWithFormat;"%d", sliderValue];
}
@end
