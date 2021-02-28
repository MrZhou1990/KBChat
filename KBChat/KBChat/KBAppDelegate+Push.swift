//
//  KBAppDelegate+Push.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/22.
//

import Foundation

extension KBAppDelegate: UNUserNotificationCenterDelegate {
    
    // 注册远程推送通知
    func registerPush() {
        // 注册token并获取回调
        UIApplication.shared.registerForRemoteNotifications()
        UNUserNotificationCenter.current().delegate = self
        
        // 手机端注册推送，弹出对话框提示用户是否允许通知
        let userNotificationCenter = UNUserNotificationCenter.current()
        userNotificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
        }
    }
    
    // 获取token失败
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // The token is not currently available.
        print("远程通知不可用: \(error.localizedDescription)")
    }

    // 获取token成功，此时将token发送给服务器
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
         // Forward the token to your provider, using a custom method.
        self.forwardTokenToServer(token: deviceToken)
    }
    
    // 将token发送给服务器
    func forwardTokenToServer(token: Data) {
        let tokenComponents = token.map { data in String(format: "%02.2hhx", data) }
        let deviceTokenString = tokenComponents.joined()
        print("token: ", deviceTokenString)
        KBToolUtils.shareInstance.token = deviceTokenString
//        let queryItems = [URLQueryItem(name: "deviceToken", value: deviceTokenString)]
//        var urlComps = URLComponents(string: "www.example.com/register")!
//        urlComps.queryItems = queryItems
//        guard let url = urlComps.url else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            // Handle data
//        }
//
//        task.resume()
    }
    
    // 程序在前台时收到提醒通知会调用此方法
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
//        guard let customData = userInfo["customData"] else {
//            return
//        }
        guard let data = userInfo["data"] as? [String : Any] else {
            return
        }
       
        
        NotificationCenter.default.post(name: Notification.Name("apspush"), object: self, userInfo: data)
        
        completionHandler(.alert)
    }
    
    // 点击推送进入会调用此方法
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // 获取推送的消息体
        let userInfo = response.notification.request.content.userInfo
        print("推送内容\n", userInfo as! [String : Any])
//        guard let specialName = userInfo["special"] as? String,
//              let specialPriceString = userInfo["price"] as? String,
//              let specialPrice = Float(specialPriceString) else {
//            // Always call the completion handler when done.
//            completionHandler()
//            return
//        }
//        let item = Item(name: specialName, price: specialPrice)
//            addItemToCart(item)
//          showCartViewController()
        completionHandler()
     }
    
    
}


