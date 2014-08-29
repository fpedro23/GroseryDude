//
//  CoreDataHelper.m
//  GroceryDude
//
//  Created by Pedro Contreras Nava on 29/08/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "CoreDataHelper.h"


@implementation CoreDataHelper



#define debug 1

#pragma mark - FILES
NSString *storeFileName = @"Grocery-Dude.sqlite";

#pragma mark - PATHS

- (NSString *)applicationDocumentsDirectory{
    if (debug==1)
    {
        NSLog(@"Running %@ '%@'", self.class,NSStringFromSelector(_cmd));
    }
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
}



- (NSURL *)applicationStoresDirectory {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    NSURL *storesDirectory = [[NSURL fileURLWithPath:[self applicationDocumentsDirectory]] URLByAppendingPathComponent:@"Stores"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[storesDirectory path]])
    {
        NSError *error = nil;
        if ([fileManager createDirectoryAtURL:storesDirectory withIntermediateDirectories:YES attributes:nil error:&error])
        {
            if (debug==1) {
                NSLog(@"Successfully created Stores directory");}
        }
        else {
            NSLog(@"FAILED to create Stores directory: %@", error);
        }
    }
    return storesDirectory;
}


- (NSURL *)storeURL {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return [[self applicationStoresDirectory] URLByAppendingPathComponent:storeFileName];
}


#pragma mark - SETUP

- (id)init
{
    if (debug==1){
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    self = [super init];
    if (!self){return nil;}
    
    _model = [NSManagedObjectModel mergedModelFromBundles:nil];
    _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_context setPersistentStoreCoordinator:_coordinator];
    
    
    return self;
}



- (void)setupCoreData{}
- (void)setupContext{}

@end
