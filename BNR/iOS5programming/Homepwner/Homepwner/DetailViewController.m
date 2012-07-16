//
//  DetailViewController.m
//  Homepwner
//
//  Created by Todd Pickell on 6/22/12.
//  Copyright (c) 2012 Columbia College. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - view override

-(void)viewWillAppear:(BOOL)animated
{
        //run super
    [super viewWillAppear:animated];
    
        //connect data to fields
    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];
    
        //create nsdateformater
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterMediumStyle];
    [df setTimeStyle:NSDateFormatterNoStyle];
    
        //use filtered NSDate ibject to set dateLabel
    [dateLabel setText:[df stringFromDate:[item dateCreated]]];
    
    NSString *imageKey = [item imageKey];
    if (imageKey) {
        //get image for image key from image store
        UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:imageKey];
        
        //use that image to display in image veiw
        [imageView setImage:imageToDisplay];
    } else {
        [imageView setImage:nil];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
        //clear first responder
    [[self view] endEditing:YES];
    
        //save changes to item
    [item setItemName:[nameField text]];
    [item setSerialNumber:[serialNumberField text]];
    [item setValueInDollars:[[valueField text] intValue]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
        //check for device type and set background color accordingly
    UIColor *clr = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        clr = [UIColor colorWithRed:0.875 green:0.88 blue:0.91 alpha:1];
    } else {
        clr = [UIColor groupTableViewBackgroundColor];
    }
    [[self view] setBackgroundColor:clr];
}

- (void)viewDidUnload
{
    nameField = nil;
    serialNumberField = nil;
    valueField = nil;
    dateLabel = nil;
    imageView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)setItem:(BNRItem *)i
{
    item =i;
    [[self navigationItem] setTitle:[item itemName]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - picture methods

- (IBAction)backgroundTapped:(id)sender 
{
    [[self view] endEditing:YES];
}

- (IBAction)takePicture:(id)sender 
{
    if ([imagePickerPopover isPopoverVisible]) {
            //if popover is allready up when user hits camera button (again) get rid of it
        [imagePickerPopover dismissPopoverAnimated:YES];
        imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
        //if device has camera take a pic
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [imagePicker setDelegate:self];
    
        //check for iPad
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            //create new popover controller to display image picker
        imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        [imagePickerPopover setDelegate:self];
        
            //display popover controller, sender is camera button
        [imagePickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    } else {
        //place image picker on screen
    [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //get key for old iage if one is allready there
    NSString *oldKey = [item imageKey];
    
    //did item allready have picture
    if (oldKey) {
        //delete image
        [[BNRImageStore sharedStore] deleteImageForKey:oldKey];
    }
    
    //get picked image from info dictionary
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //create cfuuid object for unique identifiers
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    
    //create string from unique id
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    
    //use id to set items imageKey
    //typecast with bridge to get it to convert to nsstring without arc
    NSString *key = (__bridge NSString *)newUniqueIDString;
    [item setImageKey:key];
    
    //store image in the bnrImageStore with this key
    [[BNRImageStore sharedStore] setImage:image forKey:[item imageKey]];
    
    //to release CF object before losing pointer to prevent mempry leak
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    
    //put that image onto screen
    [imageView setImage:image];
    
    //dismiss image picker
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [imagePickerPopover dismissPopoverAnimated:YES];
        imagePickerPopover = nil;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"User dismissed popover");
    imagePickerPopover = nil;
}


@end
