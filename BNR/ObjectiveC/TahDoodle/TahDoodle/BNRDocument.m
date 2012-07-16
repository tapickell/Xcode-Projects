//
//  BNRDocument.m
//  TahDoodle
//
//  Created by Todd Pickell on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRDocument.h"

@implementation BNRDocument

#pragma mark - NSDocument Overrides

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, return nil.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"BNRDocument";
}

#pragma mark - Actions

-(IBAction)createNewItem:(id)sender
{
        //if no array create one
    if (!todoItems) {
        todoItems = [NSMutableArray array];
    }
    
    [todoItems addObject:@"New Item"];
    
        //refresh the table view
    [itemTableView reloadData];
    
        //flag document as changed and unsaved
    [self updateChangeCount:NSChangeDone];
}

#pragma mark - Data Source Methods

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
        //make number of rows the same as the number of items
    return [todoItems count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn 
                                                              row:(NSInteger)row
{
        //return item that coresponds to the cell the view wants to display
    return [todoItems objectAtIndex:row];
}

-(void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
        //update items when user changes them
    [todoItems replaceObjectAtIndex:row withObject:object];
    
        //flag document as having unsaved changes
    [self updateChangeCount:NSChangeDone];
}



- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

#pragma mark - Override NSDocument methods

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
        //called when document is being saved
    if (!todoItems) {
        todoItems = [NSMutableArray array];
    }
    
        //pack todoItems array into NSData object
    NSData *data = [NSPropertyListSerialization 
                    dataWithPropertyList:todoItems 
                                  format:NSPropertyListXMLFormat_v1_0 
                                 options:0 error:outError];
    
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
        //called when document is being loaded
        //extract todoItems
    todoItems = [NSPropertyListSerialization 
                 propertyListWithData:data 
                              options:NSPropertyListMutableContainers 
                               format:NULL 
                                error:outError];
    
        //return success or fail
    return (todoItems != nil);
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

@end
