//
//  CoreDataManager.m
//  CoreDataTool
//
//  Created by 周昊 on 15/10/30.
//  Copyright © 2015年 Cloud. All rights reserved.
//

#import "CoreDataManager.h"
#define COREDATA_MANAGED_MODEL @"KBChat"

@implementation CoreDataManager

//获取Manager对象的单例
+ (CoreDataManager *)shareManager
{
    static CoreDataManager *manager = nil;
    /*非多线程版单例
    if (manager == nil)
    {
        manager = [[CoreDataManager alloc] init];
    }
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CoreDataManager alloc] init];
    });
    return manager;
}




#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
#pragma mark 返回数据库的沙盒路径
- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Free.CoreDataTool" in the application's documents directory.
    //应用程序使用的目录存储核心数据存储文件。这段代码使用了一个名为“免费的目录。CoreDataTool”应用程序的文档目录。
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    //托管应用程序的对象模型。对于应用程序来说是一个致命的错误不能够发现和负载模型。
    //懒加载
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    //数据模型的路径
    //momd是统一的后缀(相当于表)
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:COREDATA_MANAGED_MODEL withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    //应用程序的持久性存储协调员。这个实现创建并返回一个协调员,添加应用程序的存储。
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    //创建协调员和商店
    //负责数据库的链接
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    //数据库的本地绝对路径(金色小桶的位置)
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", COREDATA_MANAGED_MODEL]];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    //允许版本自动更新
    NSDictionary *option = [NSDictionary dictionaryWithObject:@(YES) forKey:NSMigratePersistentStoresAutomaticallyOption];
    //是否连接成功
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:option error:&error]) {
        // Report any error we got.
        //报告任何错误了。
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        //这个替换为适当的代码来处理错误。
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        //abort()会导致应用程序生成一个崩溃日志和终止。你不应该使用这个函数在船舶应用程序中,虽然它可能是有用的在开发过程中。
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    //返回应用程序的管理对象上下文(已绑定到应用程序的持久性存储协调员)。
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    //创建数据库连接对象
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    //创建数据库操作对象
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    //将连接对象赋给操作对象
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support
//数据库操作方法
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            //这个实现替换为适当的代码来处理错误。
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            // abort()会导致应用程序生成一个崩溃日志和终止。你不应该使用这个函数在船舶应用程序中,虽然它可能是有用的在开发过程中。
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
