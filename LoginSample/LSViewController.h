//
//  LSViewController.h
//  LoginSample
//
//  Created by Joe Cyboski on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSUser;

@interface LSViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *usernameLabel;
@property (retain, nonatomic) LSUser *user;


- (IBAction)logoutPressed:(id)sender;

@end
