//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Todd Pickell on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
        //call supers init
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Time"];
        
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:i];
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"TimeViewController loaded its view.");
    [[self view] setBackgroundColor:[UIColor greenColor]];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Current TimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Current TimeViewCOntroller will Disappear");
    [super viewWillDisappear:animated];
}

-(IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [timeLabel setText:[formatter stringFromDate:now]];
}

@end
