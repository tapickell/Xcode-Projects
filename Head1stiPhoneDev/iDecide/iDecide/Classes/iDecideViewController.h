//
//  iDecideViewController.h
//  iDecide
//
//  Created by Todd Pickell on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iDecideViewController : UIViewController {
	IBOutlet UILabel *decisionText;

}
@property (retain, nonatomic) UILabel *decisionText;

- (IBAction)buttonPressed:(id)sender;


@end

