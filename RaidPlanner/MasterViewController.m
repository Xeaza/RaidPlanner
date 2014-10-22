//
//  MasterViewController.m
//  RaidPlanner
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Adventurer.h"

@interface MasterViewController ()

@end

@implementation MasterViewController


- (IBAction)onAddNewAdventureer:(UITextField *)textField
{
    Adventurer *adventurer = [NSEntityDescription insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.managedObjectContext];
    adventurer.name = textField.text;
    adventurer.species = [NSNumber numberWithInt:arc4random_uniform(4)];

    NSError *error;
    if ([self.managedObjectContext save:&error])
    {
        [textField resignFirstResponder];
    }
    else
    {
        NSLog(@"Error Saving Adventurer: %@",error.localizedDescription);
    }

}

@end
