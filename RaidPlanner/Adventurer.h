//
//  Adventurer.h
//  RaidPlanner
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Raid;

@interface Adventurer : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * species;
@property (nonatomic, retain) NSSet *raids;
@end

@interface Adventurer (CoreDataGeneratedAccessors)

- (void)addRaidsObject:(Raid *)value;
- (void)removeRaidsObject:(Raid *)value;
- (void)addRaids:(NSSet *)values;
- (void)removeRaids:(NSSet *)values;

@end
