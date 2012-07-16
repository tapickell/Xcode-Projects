//
//  DrinkDetailViewController.h
//  DrinkMixer
//
//  Created by Tracey Pilone on 10/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrinkDetailViewController : UIViewController {
	IBOutlet UITextField *nameTextField;
	IBOutlet UITextView *ingredientsTextView;
	IBOutlet UITextView	*directionsTextView;

}

@property (nonatomic, retain) UITextField *nameTextField;
@property (nonatomic, retain) UITextView *ingredientsTextView;
@property (nonatomic, retain) UITextView *directionsTextView;

@end
