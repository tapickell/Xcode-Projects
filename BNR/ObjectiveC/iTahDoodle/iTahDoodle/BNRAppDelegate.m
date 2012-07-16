//
//  BNRAppDelegate.m
//  iTahDoodle
//
//  Created by Todd Pickell on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRAppDelegate.h"

    //c helper function
NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.td"];
}

@implementation BNRAppDelegate

@synthesize window = _window;

#pragma mark - Application delegate callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        //attempt to load existing to-do dataset from array stored to disk
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
            //if exists copy to instance variable
        tasks = [plist mutableCopy];
    } else {
        tasks = [[NSMutableArray alloc] init];
    }
    
    if ([tasks count] == 0) {
        [tasks addObject:@"Walk the dog"];
    }
    
        //create and config uiwindow instance
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    [self setWindow:theWindow];
    
        //define the rects of the ui elements
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
        //create and config the table view
    taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
        //make this object the table views data source
    [taskTable setDataSource:self];
    
        //create and config the text field
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
        //create an config button
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    
        //config insert buttons action to call this objecets -addTask: method
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
        //give button a title
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
        //add three ui elements to the window
    [[self window] addSubview:taskTable];
    [[self window] addSubview:taskField];
    [[self window] addSubview:insertButton];
    
        // finalize window and put it on screen
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



#pragma mark - Table View management

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        //number of rows equals number of tasks in array
    return [tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        //check for off screen cell available for reuse
    UITableViewCell *c = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!c) {
        c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
        //reconfig cell based on data in list array
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[c textLabel] setText:item];
    
        //return the cell to the table view
    return c;
}

#pragma mark - UIButton action addTask

-(void)addTask:(id)sender
{
        //get item from text field
    NSString *t = [taskField text];
    
    if ([t isEqualToString:@""]) {
        return;
    }
    
        //add item to array
    [tasks addObject:t];
    
        //refresh the table
    [taskTable reloadData];
    
        //clear text field
    [taskField setText:@""];
    
        //dismiss keyboard
    [taskField resignFirstResponder];
}

#pragma mark - XCode other stuff

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
        //this method called on iOS 4.0+
        //save array to disk
    [tasks writeToFile:docPath() atomically:YES];
    
    
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
        //this method called on  versions below iOS 4.0
        //save array to disk
    [tasks writeToFile:docPath() atomically:YES];
    
    
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
