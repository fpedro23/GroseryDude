//
//  PrepareTableViewController.h
//  GroceryDude
//
//  Created by Pedro Contreras Nava on 30/08/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "CoreDataTableViewController.h"

@interface PrepareTableViewController : CoreDataTableViewController <UIActionSheetDelegate>
@property (strong,nonatomic) UIActionSheet *clearConfirmActionSheet;

@end
