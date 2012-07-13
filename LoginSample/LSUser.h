//
//  Created by cybo on 7/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface LSUser : NSObject

@property(retain, nonatomic) NSString *username;
@property(retain, nonatomic) NSString *password;

- (id)initWithUsername:(NSString *)username password:(NSString *)password;


@end