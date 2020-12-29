//
//  KBChatRoomController+notification.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/29.
//

import Foundation

extension KBChatRoomController {
    
    func handleApsNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: Notification.Name("apspush"), object: nil)
    }
    
    @objc func handleNotification(_ notificatin: Notification) {
        guard let userInfo = notificatin.userInfo else {
            return
        }
        guard let body = userInfo["body"] as? String else {
            return
        }
        messageList.append(body)
        chatTableView.reloadData()
    }
}
