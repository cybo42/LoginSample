//
//  Created by cybo on 7/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class LSUser;


@interface LSAuthenticator : NSObject;

@property(nonatomic, retain) NSDictionary *users;


+ (LSAuthenticator *)sharedAuthenticator;
- (LSUser *)authenticateUsername:(NSString *) username withPassword: (NSString *) password;

@end