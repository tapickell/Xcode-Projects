//
//  MyController.h
//
//  Created by Todd Pickell on 1/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MyController : NSObject {
    IBOutlet UILabel *label;
    IBOutlet UISlider *slider;
}
- (IBAction)changeLabelText:(id)sender;
@end
