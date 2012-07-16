//
//  BNRDocument.h
//  TahDoodle
//
//  Created by Todd Pickell on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BNRDocument : NSDocument <NSTableViewDataSource>
{
    NSMutableArray *todoItems;
    IBOutlet NSTableView *itemTableView;
}

-(IBAction)createNewItem:(id)sender;

@end
