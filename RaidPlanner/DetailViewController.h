//
//  DetailViewController.h
//  RaidPlanner
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Adventurer.h"
#import "Raid.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Adventurer *adventurer;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
- (Raid *)createRaid;
@end

