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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload{
    [_delegate retain];
    [_usernameField release];
    [_passwordField release];
    [_errorLabel release];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loginPressed:(id)sender {
    NSLog(@"Login pressed");

    LSUser *validUser = [[LSAuthenticator sharedAuthenticator] authenticateUsername:self.usernameField.text withPassword:self.passwordField.text];
    if (validUser == nil){
        self.errorLabel.text = @"Invalid username or password";

    }else{
        self.delegate.user = validUser;
        [self.delegate dismissModalViewControllerAnimated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag == kPasswordFieldTag){
        [self loginPressed:nil];
    }
    
    return [textField resignFirstResponder];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}




- (void)dealloc {
    [_delegate release];
    [_usernameField release];
    [_passwordField release];
    [_errorLabel release];
    [super dealloc];
}

@end
