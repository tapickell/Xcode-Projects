//
//  CapturedListViewController.m
//  iBountyHunter
//
//  Created by Dan Pilone on 10/24/09.
//  Copyright 2009 Dan Pilone. All rights reserved.
//

#import "CapturedListViewController.h"
#import "iBountyHunterAppDelegate.h"
#import "Fugitive.h"
#import "FugitiveDetailViewController.h"

@implementation CapturedListViewController

@synthesize resultsController;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	if (self.resultsController != nil) {
		return;
	}
	
	iBountyHunterAppDelegate *appDelegate = (iBountyHunterAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Fugitive" inManagedObjectContext:managedObjectContext];
	[request setEntity:entityDescription];
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"captured == YES"];
	[request setPredicate:predicate];
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	[request setSortDescriptors:sortDescriptors];
	[sortDescriptors release];
	[sortDescriptor release];
	
	NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
																							   managedObjectContext:managedObjectContext sectionNameKeyPath:nil
																										  cacheName:@"captured_list.cache"];
	fetchedResultsController.delegate = self;
	
	NSError *error;
	BOOL success = [fetchedResultsController performFetch:&error];
	if (!success) {
		// Handle error
	}
	
	self.resultsController = fetchedResultsController;
	[request release];
	
	[self.tableView reloadData];
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
    return [[self.resultsController sections] count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.resultsController sections] objectAtIndex:section] numberOfObjects];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	Fugitive *fugitive = [self.resultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = fugitive.name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FugitiveDetailViewController *fugitiveDetailViewController = [[FugitiveDetailViewController alloc] initWithNibName:@"FugitiveDetailViewController" bundle:nil];
	fugitiveDetailViewController.fugitive = [self.resultsController objectAtIndexPath:indexPath];
	[self.navigationController pushViewController:fugitiveDetailViewController animated:YES];
	[fugitiveDetailViewController release];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView reloadData];
}


- (void)dealloc {
	[resultsController release];
    [super dealloc];
}


@end

