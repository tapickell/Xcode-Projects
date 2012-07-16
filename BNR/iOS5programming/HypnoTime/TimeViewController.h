//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Todd Pickell on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    __weak IBOutlet UILabel *timeLabel;
}

-(IBAction)showCurrentTime:(id)sender;

@end
