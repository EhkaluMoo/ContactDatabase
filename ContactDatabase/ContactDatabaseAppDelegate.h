//
//  ContactDatabaseAppDelegate.h
//  ContactDatabase
//
//  Created by webstudent on 10/6/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactDatabaseAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
