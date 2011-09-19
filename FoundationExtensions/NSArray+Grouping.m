//
//  NSArray+Grouping.m
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

#import "NSArray+Grouping.h"

@implementation NSArray (Grouping)

- (NSDictionary *)groupedUsingKeySelector:(id (^)(id))keySelector sortedByComparator:(NSComparator)comparator {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSArray *array = nil;
    
    if (comparator != nil) {
        // sort array
        array = [self sortedArrayUsingComparator:comparator];
    }
    else {
        array = self;
    }
    
    // group array
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id key = keySelector(obj);
        NSMutableArray *groupArray = [[dictionary objectForKey:key] retain];
        
        if (groupArray == nil) {
            groupArray = [[NSMutableArray alloc] init];
            [dictionary setValue:groupArray forKey:key];
        }
        
        if (![groupArray containsObject:obj]) {
            [groupArray addObject:obj];
        }
        
        [groupArray release];
    }];
    
    return dictionary;
}

@end
