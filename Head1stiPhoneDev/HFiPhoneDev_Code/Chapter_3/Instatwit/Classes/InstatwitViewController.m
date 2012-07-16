//
//  InstatwitViewController.m
//  Instatwit
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "InstatwitViewController.h"

@implementation InstatwitViewController
@synthesize tweetPicker, notesField;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	activities = [[NSArray alloc] initWithObjects:@"sleeping", @"eating", @"working", @"thinking", @"crying", @"begging",
				  @"leaving", @"shopping", @"hello worlding", nil];
	feelings = [[NSArray alloc] initWithObjects:@"awesome", @"sad", @"happy", @"ambivalent", @"nausous", @"psyched",
				@"confused", @"hopeful", @"anxious", nil];
    [super viewDidLoad];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent :(NSInteger)component {
	if (component == 0) {
		return [activities count];
	}
	else {
		return [feelings count];
	}
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (IBAction) sendButtonTapped: (id) sender {
	NSString* themessage = [NSString stringWithFormat:@" %@. I'm %@ and feeling %@ about it.",
							notesField.text ? notesField.text :@"", 
							[activities objectAtIndex:[tweetPicker selectedRowInComponent:0]],
							[feelings objectAtIndex:[tweetPicker selectedRowInComponent:1]]];
	NSLog(themessage);
	
	//TWITTER BLACK MAGIC
	NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://YOUR_TWITTER_USERNAME:YOUR_TWITTER_PASSWORD@twitter.com/statuses/update.xml"]
															cachePolicy:NSURLRequestUseProtocolCachePolicy
														timeoutInterval:60.0];
	
	[theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody:[[NSString stringWithFormat:@"status=%@", themessage] dataUsingEncoding:NSASCIIStringEncoding]];
	NSURLResponse* response;
	NSError* error;
	NSData* result = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];
	NSLog(@"%@", [[[NSString alloc] initWithData:result encoding:NSASCIIStringEncoding] autorelease]);
	
	//END TWITTER BLACK MAGIC
	
}

-(IBAction)textFieldDoneEditing: (id) sender 
{
	[sender resignFirstResponder];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent: (NSInteger)component{
	switch (component) {
			case 0:
				return [activities objectAtIndex:row];
			case 1:
				return [feelings objectAtIndex:row];
	}
				return nil;
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



- (void)dealloc {
	[tweetPicker release];
	[activities release];
	[feelings release];
	[notesField release];
    [super dealloc];
}

@end
