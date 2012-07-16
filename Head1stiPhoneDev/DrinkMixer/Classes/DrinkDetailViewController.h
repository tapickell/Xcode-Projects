//
//  DrinkDetailViewController.h
//  DrinkMixer
//
//  Created by Todd Pickell on 2/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrinkDetailViewController : UIViewController {
	NSDictionary *drink;
	IBOutlet UITextField *nameTextField;
	IBOutlet UITextView *ingredientsTextView;
	IBOutlet UITextView *directionsTextView;
	IBOutlet UIScrollView* scrollView;
	

}
@property (nonatomic, retain) UITextField *nameTextField;
@property (nonatomic, retain) UITextView *ingredientsTextView;
@property (nonatomic, retain) UITextView *directionsTextView;
@property (nonatomic, retain) NSDictionary *drink;
@property (nonatomic, retain) UIScrollView* scrollView;

@end
