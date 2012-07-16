//
//  iBountyHunterAppDelegate.h
//  iBountyHunter
//
//  Created by Dan Pilone on 10/24/09.
//  Copyright Dan Pilone 2009. All rights reserved.
//

@interface iBountyHunterAppDelegate : NSObject <UIApplicationDelegate> {

    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

    UIWindow *window;
	UITabBarController *tabcontroller;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabcontroller;

- (NSString *)applicationDocumentsDirectory;
- (void)createEditableCopyOfDatabaseIfNeeded;

@end

