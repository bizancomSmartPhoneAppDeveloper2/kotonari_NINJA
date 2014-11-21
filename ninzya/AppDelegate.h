//
//  AppDelegate.h
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/11.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property int point;
@property int time;
//@property int item;
@property int kaihi;
//@property BOOL hiddenitem;
//@property NSMutableArray *nowProject;
//@property NSMutableArray *finishProject;
@property int cleartime;
//@property int srand;
@end

