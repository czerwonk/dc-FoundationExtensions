//
//  NSArray+Grouping.h
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

#import <Foundation/Foundation.h>

@interface NSArray (Grouping)

/*
 * Groups elements of the array by using keySelector and builds a dictionary with key-array-pairs.
 * Elements in group arrays are sorted by comparator. 
 * @return Instance of NSDictionary with keySelector(obj) as key and a sorted array (per group) as value.
 */
- (NSDictionary *)groupedUsingKeySelector:(id (^)(id obj))keySelector sortedByComparator:(NSComparator)comparator;

@end
