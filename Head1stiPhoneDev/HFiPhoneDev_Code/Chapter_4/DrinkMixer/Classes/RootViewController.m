//
//  RootViewController.m
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "DrinkDetailViewController.h"


@implementation RootViewController

@synthesize drinks;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinksDirections" ofType:@"plist"];
	NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithContentsOfFile:path];
	self.drinks = tmpArray;
	[tmpArray release];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
	cell.textLabel.text = [self.drinks objectAtIndex:indexPath.row];
    return cell;
}


// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	DrinkDetailViewController *drinkDetailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
	[self.navigationController pushViewController:drinkDetailViewController animated:YES];
	[drinkDetailViewController release];
}


- (void)dealloc {
	[drinks release];
    [super dealloc];
}


@end

