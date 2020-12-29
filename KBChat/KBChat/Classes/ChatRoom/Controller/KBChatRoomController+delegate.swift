//
//  KBChatRoomController+delegate.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import Foundation

extension KBChatRoomController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if messageList.count > 0 {
            if !isScrollBottom {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
                    tableView.scrollToRow(at: IndexPath.init(item: self.messageList.count - 1, section: 0), at: .bottom, animated: false)
                }
                isScrollBottom = true
            }            
        }
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let toIdentifier = "toCell"
            var toCell = tableView.dequeueReusableCell(withIdentifier: toIdentifier) as? KBChatRoomToCell
            if toCell == nil {
                toCell = KBChatRoomToCell.init(style: .default, reuseIdentifier: toIdentifier)
            }
            toCell?.textLabel?.text = messageList[indexPath.row]
            toCell?.textLabel?.textAlignment = .right
            toCell?.selectionStyle = .none
            return toCell!
        }
        let fromIdentifier = "fromCell"
        var fromCell = tableView.dequeueReusableCell(withIdentifier: fromIdentifier) as? KBChatRoomFromCell
        if fromCell == nil {
            fromCell = KBChatRoomFromCell.init(style: .default, reuseIdentifier: fromIdentifier)
        }
        fromCell?.textLabel?.text = messageList[indexPath.row]
        fromCell?.selectionStyle = .none
        return fromCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
