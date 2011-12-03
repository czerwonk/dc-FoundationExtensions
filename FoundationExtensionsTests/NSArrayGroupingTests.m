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

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

@implementation NSArrayGroupingTests

- (void)testGroupingShouldUseKeySelector {
    NSArray *array = [NSArray arrayWithObjects:@"Abc", @"Bcd", @"Bef", nil];
    NSDictionary *dictionary = [array groupedUsingKeySelector:^(id obj) {
        return [(NSString *)obj substringToIndex:1];
    } sortedByComparator:nil];
    
    assertThat(dictionary, hasCountOf(2));
    assertThat([dictionary objectForKey:@"A"], onlyContains(@"Abc", nil));
    assertThat([dictionary objectForKey:@"B"], onlyContains(@"Bcd", @"Bef", nil));
}

- (void)testGroupingShouldAplplySortComparatorInGroups {
    NSArray *array = [NSArray arrayWithObjects:@"Abc", @"Bef", @"Bcd", nil];
    
    NSComparator sort = ^(id obj1, id obj2){
        return [(NSString *)obj1 compare:(NSString *)obj2];
    };
    NSDictionary *dictionary = [array groupedUsingKeySelector:^(id obj) {
        return [(NSString *)obj substringToIndex:1];
    } sortedByComparator:sort];
    
    assertThat([dictionary objectForKey:@"B"], contains(@"Bcd", @"Bef", nil));
}

@end
