//
//  InstatwitViewController.h
//  Instatwit
//
//  Created by Tracey Pilone on 10/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstatwitViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate> {
	
	IBOutlet UIPickerView *tweetPicker;
	IBOutlet UITextField *notesField;
	NSArray* activities;
	NSArray* feelings;

}

@property (nonatomic, retain) UIPickerView* tweetPicker;
@property (nonatomic, retain) UITextField* notesField;

- (IBAction) sendButtonTapped: (id) sender;
- (IBAction) textFieldDoneEditing: (id)sender;

@end

