//
//  AppDelegate.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//

import UIKit

@main
class KBAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 注册推送通知
//        let setting = UIUserNotificationSettings.init(types: [.alert, .badge, .sound], categories: nil)
//        UIApplication.shared.registerUserNotificationSettings(setting)
        
        
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .alert, .sound]) { (res, error) in
                print(res)
                print(error as Any)
                DispatchQueue.main.sync {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        

        
        initWindow() // 初始化window
        return true
    }
    
    // 注册APNS完成回调
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        print("注册APNS成功，开始注册TOKEN...")
        application.registerForRemoteNotifications()
    }

    // 注册TOKEN回调
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
        let token = NSString.init(data: deviceToken, encoding: String.Encoding.utf8.rawValue)
        print("获取的token: \(String(describing: token))")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("注册deviceToekn失败，错误：\(error)")
    }
}

