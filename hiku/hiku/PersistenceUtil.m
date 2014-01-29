//
//  PersistenceUtil.m
//  hiku
//
//  Created by Ophir Sweiry on 1/24/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import "PersistenceUtil.h"

@implementation PersistenceUtil

// OS: save core data to storage
+(BOOL)SaveCoreData:(NSArray *)array;{
    BOOL result=0;
    NSManagedObjectContext *context = [self managedObjectContext];
    [self deleteAllObjectsInContext:context];
    for (id object in array) {
        @try {
            // Create a new managed object
            NSManagedObject *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:context];
            [newItem setValue:[object valueForKey:@"name"] forKey:@"name"];
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
        }
    }
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }else{
        result=1;
    }
    return result;
}

// OS: load core data from storage
+(NSMutableArray *)LoadCoreData {
    NSMutableArray * result;
    @try {
        NSManagedObjectContext *context = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Item"];
        result = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        return result;
    }

}

//get managed context
+ (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

//clean storage
+ (void)deleteAllObjectsInContext:(NSManagedObjectContext *)context
{
    NSError * error;
    // retrieve the store URL
    NSURL * storeURL = [[context persistentStoreCoordinator] URLForPersistentStore:[[[context persistentStoreCoordinator] persistentStores] lastObject]];
    // lock the current context
    [context lock];
    [context reset];//to drop pending changes
    //delete the store from the current managedObjectContext
    if ([[context persistentStoreCoordinator] removePersistentStore:[[[context persistentStoreCoordinator] persistentStores] lastObject] error:&error])
    {
        // remove the file containing the data
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
        //recreate the store like in the  appDelegate method
        [[context persistentStoreCoordinator] addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];//recreates the persistent store
    }
    [context unlock];
}

@end
