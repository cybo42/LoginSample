//
//  LSAuthenticateViewController.h
//  LoginSample
//
//  Created by Joe Cyboski on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// Identifier so we know what UITextField the user pressed return in
#define kPasswordFieldTag 1

@class LSViewController;

// We are implementing the UITextFieldDelegate protocol (similar to Java Interface) so that we
// can handle events related to the text fields and keyboard
@interface LSAuthenticateViewController : UIViewController<UITextFieldDelegate>;

// This property will hold a reference to the ViewController that spawned this controller
// We need this for two reasons.
//     1) So we can pass the successfully authenticated user back to it
//     2) We need to tell the controller who spawned us to close us down. You cannot close yourself. (technically you can but its not good)
@property(nonatomic, retain) LSViewController *delegate;

@property(nonatomic, retain) UILabel *errorLabel;
@property(nonatomic, retain) UITextField *usernameField;
@property(nonatomic, retain) UITextField *passwordField;

- (IBAction)loginPressed:(id)sender;

@end
