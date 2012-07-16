//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Todd Pickell on 2/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"
@interface CalculatorViewController : UIViewController {
	IBOutlet UILabel *display;
	CalculatorBrain *brain;
	BOOL userIsInTheMiddleOfTypingANumber;
	BOOL checkForDecimalPoint;
}

- (IBAction)digetPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end

