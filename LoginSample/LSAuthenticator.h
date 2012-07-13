//
//  Created by cybo on 7/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class LSUser;


// this is a singleton class or in Objective-C a SharedInstance.
// Just a dumb class to hold users and validate their password.
@interface LSAuthenticator : NSObject;

@property(nonatomic, retain) NSMutableDictionary *users;


+ (LSAuthenticator *)sharedAuthenticator;
- (LSUser *)authenticateUsername:(NSString *) username withPassword:(NSString *) password;
- (void) addUser:(LSUser *) user;
- (void) addUsername:(NSString *) username withPassword:(NSString *) password;

@end