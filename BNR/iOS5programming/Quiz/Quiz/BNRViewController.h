//
//  BNRViewController.h
//  Quiz
//
//  Created by Todd Pickell on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRViewController : UIViewController
{
    int currentQuestionIndex;
    
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

-(IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;

@end
