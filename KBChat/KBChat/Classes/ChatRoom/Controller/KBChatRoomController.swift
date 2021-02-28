//
//  KBChatRoomController.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//  聊天对话框

import UIKit

let isIphoneX = (UIApplication.shared.statusBarFrame.size.height > 20 ? true : false)
let navigationHeight = UIApplication.shared.statusBarFrame.size.height + 44
/// 底部安全距离
let safeBottomHeight: CGFloat = (isIphoneX ? 34.0 : 0)

let chatInputViewHeight = (50 + safeBottomHeight)

class KBChatRoomController: KBBaseController {
    
    var isScrollBottom = false
    var canHide = false
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("apspush"), object: nil)
        print("聊天页销毁")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "聊天室"
        buildUI()
        handleMessageData()
        handleKeyboardNotification()
        handleApsNotification()
    }
    
    /// 创建视图UI
    private func buildUI() {
        view.sd_addSubviews([chatTableView, chatInputView])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        canHide = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        canHide = false
    }
    
    /// 聊天内容列表
    lazy var chatTableView: KBBaseTableView = {
        let chatTableView = KBBaseTableView.init(frame: CGRect.init(x: 0, y: navigationHeight, width: view.width, height: view.height - chatInputViewHeight - navigationHeight), style: .plain)
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.showsVerticalScrollIndicator = false
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapTableView))
        chatTableView.addGestureRecognizer(tap)
        if #available(iOS 11.0, *) {
            chatTableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        if #available(iOS 13.0, *) {
            chatTableView.backgroundColor = UIColor.systemGray5
        } else {
            chatTableView.backgroundColor = UIColor.white
        }
        return chatTableView
    }()
    
    @objc private func tapTableView() {
        view.endEditing(true)
    }
    
    /// 输入框
    lazy var chatInputView: KBChatInputView = {
        let chatInputView = KBChatInputView.init(frame: CGRect.init(x: 0, y: view.height - chatInputViewHeight, width: view.width, height: chatInputViewHeight))
        chatInputView.kbDelegate = self
        return chatInputView
    }()
    
    /// 聊天数据数组
    lazy var messageList: [KBMsgBody] = {
        let messageList = [KBMsgBody]()
        return messageList
    }()
    
    /// 从本地数据库中取出聊天数据处理
    private func handleMessageData() {
    }
}

extension KBChatRoomController: KBChatInputViewDelegate {
    
    func handleSendMessage(_ message: String) {
        let msg = KBMsgBody()
        msg.content = message
        msg.time = Date().dateToStringWithFormatter("YYYY-MM-DD HH:mm:ss")
        msg.direction = "to"
        messageList.append(msg)
        chatTableView.reloadData()
        chatTableView.scrollToRow(at: IndexPath.init(row: messageList.count - 1, section: 0), at: .bottom, animated: true)
    }
}

