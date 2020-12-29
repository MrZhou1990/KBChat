//
//  CoreDataManager.h
//  CoreDataTool
//
//  Created by 周昊 on 15/10/30.
//  Copyright © 2015年 Cloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

//数据模型管理类
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//数据模型
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//数据库连接类
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//数据库操作方法(增,删,改,查)
- (void)saveContext;
//数据库本地路径(沙盒路径)
- (NSURL *)applicationDocumentsDirectory;

//获取Manager对象的单例方法
+ (CoreDataManager *)shareManager;

@end
