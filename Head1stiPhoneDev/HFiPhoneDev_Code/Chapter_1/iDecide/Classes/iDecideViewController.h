//
//  iDecideViewController.h
//  iDecide
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iDecideViewController : UIViewController {
	IBOutlet UILabel *decisionText;

}
@property (retain, nonatomic) UILabel *decisionText;

-(IBAction)buttonPressed:(id)sender;

@end

