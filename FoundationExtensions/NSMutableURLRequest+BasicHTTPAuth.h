//
//  NSMutableURLRequest+BaisicHttpAuth.h
//  FoundationExtensions
//
//  Created by Daniel Czerwonk on 9/18/11.
//  Copyright 2011 Mauve Mailorder Software GmbH & Co. KG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (BasicHTTPAuth)

- (void)setBasicHTTPCredentialForUsername:(NSString *)username withPassword:(NSString *)password;

@end
