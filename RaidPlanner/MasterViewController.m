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

@property NSArray *adventurers;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAdventurers];
}

- (void)loadAdventurers
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Adventurer"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];

    NSError *error;
    if (!error) {
        self.adventurers = [self.managedObjectContext executeFetchRequest:request error:&error];
    }
    else {
        NSLog(@"Error executingFetchRequest for Adventurer: %@", error.localizedDescription);
    }
    [self.tableView reloadData];
}

- (IBAction)onAddNewAdventureer:(UITextField *)textField
{
    Adventurer *adventurer = [NSEntityDescription insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.managedObjectContext];
    adventurer.name = textField.text;
    adventurer.species = [NSNumber numberWithInt:arc4random_uniform(4)];

    NSError *error;
    if ([self.managedObjectContext save:&error])
    {
        [self loadAdventurers];
        textField.text = @"";
        [textField resignFirstResponder];
    }
    else
    {
        NSLog(@"Error Saving Adventurer: %@",error.localizedDescription);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adventurers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Adventurer *adventurer = [self.adventurers objectAtIndex:indexPath.row];

    cell.textLabel.text = adventurer.name;
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Adventurer *adventurer = [self.adventurers objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    DetailViewController *viewController = segue.destinationViewController;
    viewController.adventurer = adventurer;
}

- (IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)segue
{
    
}

@end
