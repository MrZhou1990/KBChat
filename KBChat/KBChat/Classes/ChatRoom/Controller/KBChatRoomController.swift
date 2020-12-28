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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "聊天室"
        buildUI()
        handleKeyboardNotification()
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
        return chatTableView
    }()
    
    @objc private func tapTableView() {
        view.endEditing(true)
    }
    
    /// 输入框
    lazy var chatInputView: KBChatInputView = {
        let chatInputView = KBChatInputView.init(frame: CGRect.init(x: 0, y: view.height - chatInputViewHeight, width: view.width, height: chatInputViewHeight))
        return chatInputView
    }()
    
    
    deinit {
        print("聊天页面销毁")
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

