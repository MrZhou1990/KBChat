//
//  KBChatRoomController+keyboard.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import Foundation

extension KBChatRoomController {
    /// 处理键盘通知
    public func handleKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// 键盘弹出
    @objc private func keyboardShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String : Any] else {
            return
        }
        guard let keyboardRectValue = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else {
            return
        }
        let keyboardHeight = keyboardRectValue.size.height
        // 设置tableView内部滚动区域
        chatTableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: keyboardHeight + navigationHeight, right: 0)
        chatTableView.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: keyboardHeight + navigationHeight, right: 0)
        
        UIView.animate(withDuration: 0.3) {
            self.chatInputView.y = self.view.height - keyboardHeight - chatInputViewHeight
            self.chatTableView.contentOffset = CGPoint.init(x: 0, y: self.chatTableView.contentSize.height - self.chatInputView.y + navigationHeight)
        }
    }
    
    /// 键盘收起
    @objc private func keyboardHide(_ notification: Notification) {
        if canHide {
            print("走这个方法了")
            chatTableView.contentInset = UIEdgeInsets.zero
            chatTableView.scrollIndicatorInsets = UIEdgeInsets.zero

            UIView.animate(withDuration: 0.3) {
                self.chatInputView.y = self.view.height - chatInputViewHeight
            }
        }
    }
}
