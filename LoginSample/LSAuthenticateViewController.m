//
//  LSAuthenticateViewController.m
//  LoginSample
//
//  Created by Joe Cyboski on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LSAuthenticateViewController.h"
#import "LSViewController.h"
#import "LSAuthenticator.h"

@interface LSAuthenticateViewController ()

@end

@implementation LSAuthenticateViewController {
    @private
    LSViewController *_delegate;
    IBOutlet UITextField *_usernameField;
    IBOutlet UITextField *_passwordField;
    IBOutlet UILabel *_errorLabel;
}

@synthesize delegate = _delegate;
@synthesize errorLabel = _errorLabel;
@synthesize usernameField = _usernameField;
@synthesize passwordField = _passwordField;


// Standard Boilerplate code
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // When the view has been loaded we register ourselves as the UITextFieldDelegate for both text fields
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;
}

// Standard Boilerplate code - cleanup when view is unloaded from memory. The controller may still exist but UI elements have been discarded
- (void)viewDidUnload{
    [_delegate retain];
    [_usernameField release];
    [_passwordField release];
    [_errorLabel release];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Standard Boilerplate code - locks orientation to portrait
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loginPressed:(id)sender {
    NSLog(@"Login pressed");

    // When login button has been pressed validate credentials with the Authenticator
    LSUser *validUser = [[LSAuthenticator sharedAuthenticator] authenticateUsername:self.usernameField.text
                                                                       withPassword:self.passwordField.text];
    // If authentication fails or user didn't exist we message the user
    if (validUser == nil){
        self.errorLabel.text = @"Invalid username or password";

    }else{
        // If everything is good, we set the user onto the main view controller, and tell it to dismiss the authentication controller
        self.delegate.user = validUser;
        [self.delegate dismissModalViewControllerAnimated:YES];
    }
}

// Handles when you press return in either text field
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // If you pressed return in the password text field we will trigger loginPressed for you
    if (textField.tag == kPasswordFieldTag){
        [self loginPressed:nil];
    }

    // this closed the keyboard if you press return in either text field
    return [textField resignFirstResponder];
}

// If you leave the text field we will close the keyboard
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}


// Standard Boilerplate code - cleanup when controller is destroyed
- (void)dealloc {
    [_delegate release];
    [_usernameField release];
    [_passwordField release];
    [_errorLabel release];
    [super dealloc];
}

@end
