//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Todd Pickell on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
        //get bundle
    NSBundle *appBundle = [NSBundle mainBundle];
    
        //call supers init
    self = [super initWithNibName:@"TimeViewController" bundle:appBundle];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"HypnosisViewController loaded its view.");
}

-(void)loadView
{
        //create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
        //set it as the view of this view controller
    [self setView:v];
}

@end
