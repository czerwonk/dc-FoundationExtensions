//
//  NSArrayGroupingTests.m
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

#import "NSArrayGroupingTests.h"
#import "NSArray+Grouping.h"

@implementation NSArrayGroupingTests

- (void)testGroupingShouldUseKeySelector {
    NSArray *array = [NSArray arrayWithObjects:@"Abc", @"Bcd", @"Bef", nil];
    NSDictionary *dictionary = [array groupedUsingKeySelector:^(id obj) {
        return [(NSString *)obj substringToIndex:1];
    } sortedByComparator:nil];
    
    STAssertEquals((int)[dictionary count], 2, nil, @"dictionary should contain 2 keys");
    
    NSArray *array1 = [[dictionary objectForKey:@"A"] retain];
    STAssertEquals((int)[array1 count], 1, @"array for key A should only contain 1 string");
    STAssertEqualObjects([array1 objectAtIndex:0], @"Abc", nil);
    [array1 release];
    
    NSArray *array2 = [[dictionary objectForKey:@"B"] retain];
    STAssertEquals((int)[array2 count], 2, @"array for key B should contain 2 strings");
    STAssertEqualObjects([array2 objectAtIndex:0], @"Bcd", nil);
    STAssertEqualObjects([array2 objectAtIndex:1], @"Bef", nil);
    [array2 release];
}

- (void)testGroupingShouldAplplySortComparatorInGroups {
    NSArray *array = [NSArray arrayWithObjects:@"Abc", @"Bef", @"Bcd", nil];
    
    NSComparator sort = ^(id obj1, id obj2){
        return [(NSString *)obj1 compare:(NSString *)obj2];
    };
    NSDictionary *dictionary = [array groupedUsingKeySelector:^(id obj) {
        return [(NSString *)obj substringToIndex:1];
    } sortedByComparator:sort];
    
    NSArray *groupForKeyB = [[dictionary objectForKey:@"B"] retain];
    STAssertEqualObjects([groupForKeyB objectAtIndex:0], @"Bcd", nil);
    STAssertEqualObjects([groupForKeyB objectAtIndex:1], @"Bef", nil);
    [groupForKeyB release];
}

@end
