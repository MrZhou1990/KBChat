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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(KBChatRoomController(), animated: true)
    }
}
