//
//  LSAuthenticateViewController.h
//  LoginSample
//
//  Created by Joe Cyboski on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPasswordFieldTag 1

@class LSViewController;

@interface LSAuthenticateViewController : UIViewController<UITextFieldDelegate>;

@property(nonatomic, retain) LSViewController *delegate;
@property(nonatomic, retain) UILabel *errorLabel;
@property(nonatomic, retain) UITextField *usernameField;
@property(nonatomic, retain) UITextField *passwordField;

- (IBAction)loginPressed:(id)sender;

@end
