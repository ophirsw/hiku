//
//  com_hiku_AppDelegate.h
//  hiku
//
//  Created by Ophir Sweiry on 1/22/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface com_hiku_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
