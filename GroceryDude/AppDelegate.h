//
//  AppDelegate.h
//  GroceryDude
//
//  Created by Pedro Contreras Nava on 29/08/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) CoreDataHelper *coreDataHelper;

@end
