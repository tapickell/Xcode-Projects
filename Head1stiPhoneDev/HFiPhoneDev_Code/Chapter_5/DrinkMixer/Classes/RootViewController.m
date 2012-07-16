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

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction) addButtonPressed: (id)sender {
	NSLog(@"Add button pressed!");
	
	AddDrinkViewController *addDrinkVC = [[AddDrinkViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
	UINavigationController *addNavCon = [[UINavigationController alloc] initWithRootViewController:addDrinkVC];
	[self presentModalViewController:addNavCon animated:YES];
	[addDrinkVC release];
	[addNavCon release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
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
	DrinkDetailViewController *drinkDetailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
	drinkDetailViewController.drink = [self.drinks objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:drinkDetailViewController animated:YES];
	[drinkDetailViewController release];
}

- (void)dealloc {
	[drinks release];
	[addButtonItem release];
    [super dealloc];
}


@end

