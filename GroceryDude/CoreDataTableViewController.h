//
//  CoreDataTableViewController.h
//  GroceryDude
//
//  Created by Pedro Contreras Nava on 30/08/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"

@interface CoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (strong,nonatomic) NSFetchedResultsController *frc;
-(void)performFetch;

@end
