//
//  DetailViewController.h
//  Homepwner
//
//  Created by Todd Pickell on 6/22/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, 
    UITextFieldDelegate, UIPopoverControllerDelegate>
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIImageView *imageView;
    
    UIPopoverController *imagePickerPopover;
}

@property (nonatomic, strong)BNRItem *item;

- (id)initForNewItem:(BOOL)isNew;

- (IBAction)backgroundTapped:(id)sender;
- (IBAction)takePicture:(id)sender;

@end
