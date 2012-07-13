//
//  LSViewController.m
//  LoginSample
//
//  Created by Joe Cyboski on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LSViewController.h"
#import "LSUser.h"
#import "LSAuthenticateViewController.h"

@interface LSViewController ()

@end

@implementation LSViewController {
@private
    UILabel *_usernameLabel;
    LSUser *_user;
}

@synthesize usernameLabel = _usernameLabel;
@synthesize user = _user;

- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
When the view has appeared on the page, we check to see if there is a user object (LSUser) stored
on the view controller. If not then we display a new controller to authenticate the user.

FYI, this has to be done in the viewDidAppear and not viewDidLoad since the UI isn't fully setup
the call to presentModalViewController will not work in viewDidLoad.

 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"user %@", self.user);

    if (self.user == nil){
        NSLog(@"No user, authenticating");
        LSAuthenticateViewController *authController = [[LSAuthenticateViewController alloc] initWithNibName:@"LSAuthenticateViewController" bundle:nil];
        authController.delegate = self;

        [self presentModalViewController:authController animated:YES];
        [authController release];
        
    }else{
        // If we have a user stored on the controller, then put the username into a label for display.
        self.usernameLabel.text = self.user.username;
    }
}

// Standard Boilerplate code - cleanup when view is unloaded from memory. The controller may still exist but UI elements have been discarded
- (void)viewDidUnload {
    [self setUsernameLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

// Standard Boilerplate code - locks orientation to portrait
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)logoutPressed:(id)sender{
    // Clear out user and anything related to the user
    self.usernameLabel.text = nil;
    self.user = nil;

    // Show the authentication controller since we no longer have a user
    LSAuthenticateViewController *authController = [[LSAuthenticateViewController alloc] initWithNibName:@"LSAuthenticateViewController" bundle:nil];
    authController.delegate = self;
    [self presentModalViewController:authController animated:YES];
    [authController release];    
}


// Standard Boilerplate code - cleanup when controller is destroyed
- (void)dealloc {
    [_usernameLabel release];
    [_user release];
    [super dealloc];
}
@end
