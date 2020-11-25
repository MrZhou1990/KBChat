//
//  KBChatListController.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//  对话列表

import UIKit

class KBChatListController: KBBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "聊天列表"
        buildUI()
    }
    
    private func buildUI () {
        view.addSubview(chatListTableView)
        chatListTableView.sd_layout()?.spaceToSuperView(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    lazy var chatListTableView: KBBaseTableView = {
        let chatListTableView = KBBaseTableView.init(frame: CGRect.zero, style: .plain)
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        return chatListTableView
    }()
}

extension KBChatListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "聊天\(indexPath.row + 1)"
        cell?.detailTextLabel?.text = "内容"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(KBChatRoomController(), animated: true)
    }
}
