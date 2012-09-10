//
//  AppDelegate.h
//  Linking Numbers
//
//  Created by Jeffrey Monte on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManagement.h"
#import "ShopViewController.h"

@class LevelSelectionViewController;
@class CategoryViewController;
@class MainMenuViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UINavigationController *mainNavigationController;
    
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;  
    NSPersistentStoreCoordinator  *persistentStoreCoordinator;
    
    DataManagement *dataManagement;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainMenuViewController *viewController;
@property(nonatomic, retain)UINavigationController *mainNavigationController;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator  *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) DataManagement *dataManagement;


@end
