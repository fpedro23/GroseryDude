//
//  AppDelegate.m
//  GroceryDude
//
//  Created by Pedro Contreras Nava on 29/08/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "AppDelegate.h"
#import "Item.h"
#import "Amount.h"

@implementation AppDelegate

#define debug 1


- (void) demo {
    /*if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd)); }
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    
    //    NSFetchRequest * request = [[[_coreDataHelper model] fetchRequestTemplateForName:@"Test"] copy];
    
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
  //  [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    
   // NSPredicate *filter = [NSPredicate predicateWithFormat:@"name != %@",@"Coffee"];
   // [request setPredicate:filter];
    
    
     NSArray *fetchedObjects = [_coreDataHelper.context executeFetchRequest:request error:nil];
    
    for(Item *item in fetchedObjects){
        NSLog(@"Deleting Object = %@",item.name);
    [_coreDataHelper.context deleteObject:item];
    }*/
    
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd)); }
    NSFetchRequest *request =
    [NSFetchRequest fetchRequestWithEntityName:@"Amount"]; [request setFetchLimit:50];
    NSError *error = nil;
    NSArray *fetchedObjects =
    [_coreDataHelper.context executeFetchRequest:request error:&error];
    if (error) {NSLog(@"%@", error);} else {
        for (Amount *amount in fetchedObjects) { NSLog(@"Fetched Object = %@", amount.xyz);
        } }
}

-(CoreDataHelper *)cdh{
    
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    if (debug==1) { NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd)); }
    
    if (!_coreDataHelper) {
        _coreDataHelper = [CoreDataHelper new];
        [_coreDataHelper setupCoreData];
    }
    return _coreDataHelper;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[self cdh] saveContext];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    [self cdh];
    [self demo];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[self cdh] saveContext];
}

@end
