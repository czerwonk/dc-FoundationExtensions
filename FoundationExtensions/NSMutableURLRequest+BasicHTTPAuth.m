//
//  NSMutableURLRequest+BaisicHttpAuth.m
//  FoundationExtensions
//
//  Created by Daniel Czerwonk on 9/18/11.
//  Copyright 2011 Mauve Mailorder Software GmbH & Co. KG. All rights reserved.
//

#import "NSMutableURLRequest+BasicHTTPAuth.h"
#import "NSData+Base64.h"

@implementation NSMutableURLRequest (BasicHTTPAuth)

- (void)setBasicHTTPCredentialForUsername:(NSString *)username withPassword:(NSString *)password {
    NSString *usernamePasswordString = [[NSString alloc] initWithFormat:@"%@:%@", username, password];
    NSData *authData = [usernamePasswordString dataUsingEncoding:NSUTF8StringEncoding];
    [usernamePasswordString release];
    
    NSString *authString = [[NSString alloc] initWithFormat:@"Basic %@", [authData base64EncodedString]];
    [self setValue:authString forHTTPHeaderField:@"Authorization"];
    [authString release];
}

@end
