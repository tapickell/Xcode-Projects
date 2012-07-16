//
//  RootViewController.m
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"
#import "AddDrinkViewController.h"


@implementation RootViewController

@synthesize drinks, addButtonItem;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinksDirections" ofType:@"plist"];
	NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithContentsOfFile:path];
	self.drinks = tmpArray;
	[tmpArray release];
	self.navigationItem.rightBarButtonItem = self.addButtonItem;
	
	// Register for application exiting information so we can save data
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillTerminate:) name:UIApplicationWillTerminateNotification object:nil];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (IBAction) addButtonPressed: (id)sender {
	NSLog(@"Add button pressed!");
	
	AddDrinkViewController *addDrinkVC = [[AddDrinkViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
	UINavigationController *addNavCon = [[UINavigationController alloc] initWithRootViewController:addDrinkVC];
	addDrinkVC.drinkArray = self.drinks;
	[self presentModalViewController:addNavCon animated:YES];
	[addDrinkVC release];
	[addNavCon release];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Unregister for notifications
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.drinks count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [[self.drinks objectAtIndex:indexPath.row] objectForKey:NAME_KEY];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}




// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (!self.editing) {		
		DrinkDetailViewController *drinkDetailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
		drinkDetailViewController.drink = [self.drinks objectAtIndex:indexPath.row];
		[self.navigationController pushViewController:drinkDetailViewController animated:YES];
		[drinkDetailViewController release];
	}
	else {
		AddDrinkViewController *editingDrinkVC = [[AddDrinkViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
		UINavigationController *editingNavCon = [[UINavigationController alloc] initWithRootViewController:editingDrinkVC];
		editingDrinkVC.drink = [self.drinks objectAtIndex:indexPath.row];
		editingDrinkVC.drinkArray = self.drinks;
		[self.navigationController presentModalViewController:editingNavCon animated:YES];
		[editingDrinkVC release];
		[editingNavCon release];
	}
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
		[self.drinks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}


-(void) applicationWillTerminate: (NSNotification *)notification {
	NSString *path = [[NSBundle mainBundle]
					  pathForResource:@"DrinkDirections" ofType:@"plist"];
	[self.drinks writeToFile:path atomically:YES];
}

- (void)dealloc {
	[drinks release];
	[addButtonItem release];
    [super dealloc];
}


@end

