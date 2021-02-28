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
        let msg = KBMsgBody()
        msg.content = userInfo["subTitle"] as? String
        msg.time = userInfo["sendTime"] as? String
        msg.direction = "from"
        messageList.append(msg)
        chatTableView.reloadData()
        chatTableView.scrollToRow(at: IndexPath.init(row: messageList.count - 1, section: 0), at: .bottom, animated: true)
    }
}
