//
//  KBAppDelegate+Window.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//

import UIKit

extension KBAppDelegate {
    
    /// 初始化Window
    func initWindow() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let nav = UINavigationController.init(rootViewController: KBChatListController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}
