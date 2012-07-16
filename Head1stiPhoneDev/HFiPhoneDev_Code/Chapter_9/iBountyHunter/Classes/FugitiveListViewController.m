//
//  FugitiveListViewController.m
//  iBountyHunter
//
//  Created by Dan Pilone on 10/24/09.
//  Copyright 2009 Dan Pilone All rights reserved.
//

#import "FugitiveListViewController.h"
#import "iBountyHunterAppDelegate.h"
#import "Fugitive.h"
#import "FugitiveDetailViewController.h"



@implementation FugitiveListViewController

@synthesize items;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	iBountyHunterAppDelegate *appDelegate = (iBountyHunterAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Fugitive" inManagedObjectContext:managedObjectContext];
	[request setEntity:entityDescription];
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	[request setSortDescriptors:sortDescriptors];
	[sortDescriptors release];
	[sortDescriptor release];
	
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	if (mutableFetchResults == nil) {
		// Handle error
	}
	
	self.items = mutableFetchResults;
	[mutableFetchResults release];
	[request release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	Fugitive *fugitive = [items objectAtIndex:indexPath.row];
	cell.textLabel.text = fugitive.name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FugitiveDetailViewController *fugitiveDetailViewController = [[FugitiveDetailViewController alloc] initWithNibName:@"FugitiveDetailViewController" bundle:nil];
	fugitiveDetailViewController.fugitive = [self.items objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:fugitiveDetailViewController animated:YES];
	[fugitiveDetailViewController release];
}

- (void)dealloc {
	[items release];
	
    [super dealloc];
}


@end

