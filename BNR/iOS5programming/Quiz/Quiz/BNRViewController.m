//
//  BNRViewController.m
//  Quiz
//
//  Created by Todd Pickell on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRViewController.h"

@implementation BNRViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //call supers init method
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //create two arrays
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        
        //add questions and answers
        [questions addObject:@"What is 7 + 7?"];
        [answers addObject:@"14"];
        
        [questions addObject:@"What is the capitol of Vermont?"];
        [answers addObject:@"Montpelier"];
        
        [questions addObject:@"From what is cognac made?"];
        [answers addObject:@"Grapes"];
    }
    return self;
}

-(IBAction)showQuestion:(id)sender
{
    currentQuestionIndex++;
    
    if (currentQuestionIndex == [questions count]) {
        currentQuestionIndex = 0;
    }
    
    NSString *question = [questions objectAtIndex:currentQuestionIndex];
    
    NSLog(@"displaying question: %@", question);
    
    [questionField setText:question];
    
    [answerField setText:@"???"];
}

-(IBAction)showAnswer:(id)sender
{
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];
    
    [answerField setText:answer];
    
}

@end
