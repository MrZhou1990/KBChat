//
//  AppDelegate.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//

import UIKit
import CoreData

@main
class KBAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initWindow() // 初始化window
        registerPush() // 注册推送
        
//        if #available(iOS 11.0, *) {
//            UITableView.appearance().contentInsetAdjustmentBehavior = .never
//            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
//            UICollectionView.appearance().contentInsetAdjustmentBehavior = .never
//        } else {
//            // Fallback on earlier versions
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.saveContext()
//        }
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Save changes in the application's managed object context when the application transitions to the background.
//        (UIApplication.shared.delegate as? KBAppDelegate)?.saveContext()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "KBChat")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.content = "你好我是渣渣辉"
        message.mId = "1"
        if context.hasChanges {
            do {
                try context.save()
                print("保存成功！")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    /// 添加数据
    func addData()
    {
        //获取管理的数据上下文 对象
        let app = UIApplication.shared.delegate as! KBAppDelegate
        let context = app.persistentContainer.viewContext
         
        
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.content = "你好我是渣渣辉"
        message.mId = "1"
         
        //保存
        do {
            try context.save()
            print("保存成功！")
        } catch {
            fatalError("不能保存：\(error)")
        }
    }
    
    func queryData() {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Message>(entityName:"Message")
        do {
            let fetchObjects = try context.fetch(fetchRequest)
            for item in fetchObjects {
                print(item)
            }
        } catch {
            fatalError("错误")
        }
        
    }
}

