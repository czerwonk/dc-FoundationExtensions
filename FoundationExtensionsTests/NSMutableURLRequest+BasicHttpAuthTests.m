//
//  FoundationExtensionsTests.m
//  FoundationExtensionsTests
//
//  Created by Daniel Czerwonk on 9/18/11.
//  Copyright 2011 Mauve Mailorder Software GmbH & Co. KG. All rights reserved.
//

#import "NSMutableURLRequest+BasicHTTPAuthTests.h"
#import "NSMutableURLRequest+BasicHTTPAuth.h"

@implementation NSMutableURLRequestBasicHTTPAuthTests

- (void)testBasicHttpIsSetCorrectInHeader
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setBasicHTTPCredentialForUsername:@"username" withPassword:@"password"];
    NSString *authHeaderValue = [request valueForHTTPHeaderField:@"Authorization"];
    STAssertEqualObjects(authHeaderValue, @"Basic dXNlcm5hbWU6cGFzc3dvcmQ=", nil);
}

@end
