//
//  Created by cybo on 7/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "LSAuthenticator.h"
#import "LSUser.h"

static LSAuthenticator *_sharedAuthenticator;

@implementation LSAuthenticator{
    @private
    NSMutableDictionary *_users;
}
@synthesize users = _users;

// This is the init method that will initialize LSAuthenticator the very first time.
// It also pre-populates itself with some users.
+(LSAuthenticator *)sharedAuthenticator {
    @synchronized (self) {
        if (_sharedAuthenticator == nil){
            _sharedAuthenticator = [[self alloc] init];

            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            _sharedAuthenticator.users = dict;
            [dict release];

            // Populate some users
            [_sharedAuthenticator addUsername:@"cybo42@gmail.com" withPassword:@"password123"];
            [_sharedAuthenticator addUsername:@"admin@example.com" withPassword:@"password"];
        }
    }

    return _sharedAuthenticator;
}

- (LSUser *)authenticateUsername:(NSString *)username withPassword :(NSString *)password {
    // Lookup user in the internal Dictionary (Map) then see if the password provide matches. If it does return the user, if not nil
    LSUser *testUser = [self.users objectForKey:username];
    if ([testUser.password isEqualToString:password]){
        return testUser;
    }

    return nil;
}

- (void)addUser:(LSUser *)user {
    [self.users setObject:user forKey:user.username];
}

- (void)addUsername:(NSString *)username withPassword:(NSString *)password {
    LSUser *user = [[LSUser alloc] initWithUsername:username password:password];
    [self addUser:user];
    [user release];
}


- (void)dealloc {
    [_users release];
    [super dealloc];
}

@end