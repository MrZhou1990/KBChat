//
//  KBChatRoomController.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//  聊天对话框

import UIKit

class KBChatRoomController: KBBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "聊天室"
        buildUI()
    }
    
    private func buildUI () {
        view.sd_addSubviews([chatTableView, chatInputView])
        // 聊天输入框
        _ = chatInputView.sd_layout()?.leftEqualToView(view)?.rightEqualToView(view)?.bottomEqualToView(view)?.heightIs(80)
        // 聊天列表
        _ = chatTableView.sd_layout()?.leftEqualToView(view)?.rightEqualToView(view)?.topEqualToView(view)?.bottomSpaceToView(chatInputView, 0)
        
    }
    
    lazy var chatTableView: KBBaseTableView = {
        let chatTableView = KBBaseTableView.init(frame: CGRect.zero, style: .plain)
        chatTableView.delegate = self
        chatTableView.dataSource = self
        return chatTableView
    }()
    
    lazy var chatInputView: KBChatInputView = {
        let chatInputView = KBChatInputView.init(frame: CGRect.zero)
        return chatInputView
    }()
}

extension KBChatRoomController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "哈哈"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
