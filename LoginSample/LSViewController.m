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


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"user %@", self.user);

    if (self.user == nil){
        NSLog(@"No user, authenticating");
        LSAuthenticateViewController *authController = [[LSAuthenticateViewController alloc] initWithNibName:@"LSAuthenticatViewController" bundle:nil];
        authController.delegate = self;

        [self presentModalViewController:authController animated:YES];
        [authController release];
        
    }else{
        self.usernameLabel.text = self.user.username;
    }
}

- (void)viewDidUnload {
    [self setUsernameLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)logoutPressed:(id)sender{
    self.usernameLabel.text = nil;
    self.user = nil;
    
    LSAuthenticateViewController *authController = [[LSAuthenticateViewController alloc] initWithNibName:@"LSAuthenticatViewController" bundle:nil];
    authController.delegate = self;
    [self presentModalViewController:authController animated:YES];
    [authController release];    
}


- (void)dealloc {
    [_usernameLabel release];
    [_user release];
    [super dealloc];
}
@end
