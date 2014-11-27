//
//  AppDelegate.h
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/11.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Sound.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//ストーリーボードの名前の変数
@property (nonatomic) NSString  *sbName;

//iPhone4Sかどうかの判定のための変数
@property NSInteger deviceNum;

@property int point;
@property int time;
//@property int item;
@property int kaihi;
//@property BOOL hiddenitem;
//@property NSMutableArray *nowProject;
//@property NSMutableArray *finishProject;
@property int cleartime;
//@property int srand;

@property int level; //初級=1、中級=2、上級=3

//アイテム使用中かどうかの判定
@property BOOL bunshin;
@property BOOL renkin;
@property BOOL kakuremi;
//オープニング用のサウンドの変数
@property Sound *opsound;

@end

