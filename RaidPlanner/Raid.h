//
//  Raid.h
//  RaidPlanner
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Adventurer;

@interface Raid : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSSet *adventurers;
@end

@interface Raid (CoreDataGeneratedAccessors)

- (void)addAdventurersObject:(Adventurer *)value;
- (void)removeAdventurersObject:(Adventurer *)value;
- (void)addAdventurers:(NSSet *)values;
- (void)removeAdventurers:(NSSet *)values;

@end
