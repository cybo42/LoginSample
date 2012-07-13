//
//  Created by cybo on 7/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "LSUser.h"


@implementation LSUser {

@private
    NSString *_username;
    NSString *_password;
}
@synthesize username = _username;
@synthesize password = _password;

- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = [username copy];
        _password = [password copy];
    }
    return self;
}


- (void)dealloc {
    [_username release];
    [_password release];
    [super dealloc];
}


@end