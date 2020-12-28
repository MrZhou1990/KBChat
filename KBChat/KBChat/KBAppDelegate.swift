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
        
        initWindow() // 初始化window
        registerPush() // 注册推送
        
//        if #available(iOS 11.0, *) {
//            UITableView.appearance().contentInsetAdjustmentBehavior = .never
//            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
//            UICollectionView.appearance().contentInsetAdjustmentBehavior = .never
//        } else {
//            // Fallback on earlier versions
//        }
        
        return true
    }
    
    
}

