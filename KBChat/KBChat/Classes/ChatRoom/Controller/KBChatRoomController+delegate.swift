//
//  KBChatRoomController+delegate.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import Foundation

extension KBChatRoomController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if messageList.count > 0 && !isScrollBottom {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
                tableView.scrollToRow(at: IndexPath.init(item: self.messageList.count - 1, section: 0), at: .bottom, animated: false)
            }
            isScrollBottom = true
        }
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let msg = messageList[indexPath.row]
        if msg.direction == "to" {
            let toIdentifier = "toCell"
            var toCell = tableView.dequeueReusableCell(withIdentifier: toIdentifier) as? KBChatRoomToCell
            if toCell == nil {
                toCell = KBChatRoomToCell.init(style: .default, reuseIdentifier: toIdentifier)
            }
            let msg = messageList[indexPath.row]
            toCell?.timeLabel.text = msg.time//?.dateToStringWithFormatter("YYYY-MM-DD HH:mm:ss")
            toCell?.toMessageLabel.text = msg.content
            return toCell!
        }
        let fromIdentifier = "fromCell"
        var fromCell = tableView.dequeueReusableCell(withIdentifier: fromIdentifier) as? KBChatRoomFromCell
        if fromCell == nil {
            fromCell = KBChatRoomFromCell.init(style: .default, reuseIdentifier: fromIdentifier)
        }
        fromCell?.timeLabel.text = msg.time//?.dateToStringWithFormatter("YYYY-MM-DD HH:mm:ss")
        fromCell?.fromMessageLabel.text = msg.content
        return fromCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row % 2 == 0 {
//            return tableView.cellHeight(for: indexPath, model: messageList[indexPath.row], keyPath: "", cellClass: KBChatRoomToCell.self, contentViewWidth: UIScreen.main.bounds.size.width)
//        }
//        return tableView.cellHeight(for: indexPath, model: messageList[indexPath.row], keyPath: "", cellClass: KBChatRoomFromCell.self, contentViewWidth: UIScreen.main.bounds.size.width)
        return 100
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
