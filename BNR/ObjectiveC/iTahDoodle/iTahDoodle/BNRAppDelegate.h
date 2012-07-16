//
//  BNRAppDelegate.h
//  iTahDoodle
//
//  Created by Todd Pickell on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}

-(void)addTask:(id)sender;


@property (strong, nonatomic) UIWindow *window;

@end
