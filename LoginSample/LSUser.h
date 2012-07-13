//
//  Created by cybo on 7/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

/*
Simple object that just holds a username and password
 */

@interface LSUser : NSObject

@property(retain, nonatomic) NSString *username;
@property(retain, nonatomic) NSString *password;

- (id)initWithUsername:(NSString *)username password:(NSString *)password;


@end