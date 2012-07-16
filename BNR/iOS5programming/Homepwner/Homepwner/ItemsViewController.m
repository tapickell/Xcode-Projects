//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Todd Pickell on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

#pragma mark - init method overrides

    //override init
-(id)init
{
        //call supers init
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"Homepwner"];
        
            //create new bar button item
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
            //set bar button item to the right
        [[self navigationItem] setRightBarButtonItem:bbi];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }
    return self;
}

    //overide initWithStyle
-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)io
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return YES;
    } else {
        return (io == UIInterfaceOrientationPortrait);
    }
}

#pragma mark - detail view method

-(void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [[DetailViewController alloc] init];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = [items objectAtIndex:[indexPath row]];
    
        //give detail view controller a pointer to the item object in row
    [dvc setItem:selectedItem];
    
    //push to top of nav view controllers stack
    [[self navigationController] pushViewController:dvc animated:YES];
}

-(IBAction)addNewItem:(id)sender
{
        //create new BNRItem and add it to store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
        //get index of new item in store
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
        //create path to row for new item
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
        //insert new row into the table
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark - table view method overrides

    //overide tableView numberOfRows
-(NSInteger)tableView:(UITableView *)tableView 
numberOfRowsInSection:(NSInteger)section
{
        //returns number of items stored
    return [[[BNRItemStore sharedStore] allItems] count];
}

    //overide table view cellForRowAtPath
-(UITableViewCell *)tableView:(UITableView *)tableView 
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        //check for reusable cell first
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        //if no cell to reuse then create one
    if (!cell) {
            //create instance of UITableViewCell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
        //get item at index
    BNRItem *p = [[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
        //set text on cell from item
    [[cell textLabel] setText:[p description]];
        //return instance
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

#pragma mark - table view edit methods

    //override table view commit editing style for row at index path (ie delete)
-(void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath
{
        //if table view is asking to commit a delete
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BNRItemStore *ps = [BNRItemStore sharedStore];
        NSArray *items = [ps allItems];
        BNRItem *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];
        
        //also remove that ow from the table view with a fade animation
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView 
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
     toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}



@end
