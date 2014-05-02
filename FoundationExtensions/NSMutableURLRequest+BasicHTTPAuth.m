//
//  NSMutableURLRequest+BaisicHttpAuth.m
//  FoundationExtensions
//
//  Created by Daniel Czerwonk on 9/18/11.
//  Copyright 2011 Daniel Czerwonk <d.czerwonk@gmail.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>
//

#import "NSMutableURLRequest+BasicHTTPAuth.h"
#import "NSData+Base64.h"

@implementation NSMutableURLRequest (BasicHTTPAuth)

- (void)setBasicHTTPCredentialForUsername:(NSString *)username withPassword:(NSString *)password {
    NSString *usernamePasswordString = [[NSString alloc] initWithFormat:@"%@:%@", username, password];
    NSData *authData = [usernamePasswordString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *authString = [[NSString alloc] initWithFormat:@"Basic %@", [authData base64EncodedString]];
    [self setValue:authString forHTTPHeaderField:@"Authorization"];
}

@end
