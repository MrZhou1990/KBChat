//
//  KBChatRoomController.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//  聊天对话框

import UIKit

let isIphoneX = (UIApplication.shared.statusBarFrame.size.height > 20 ? true : false)
/// 底部安全距离
let safeBottomHeight: CGFloat = (isIphoneX ? 34.0 : 0)

let chatInputViewHeight = (50 + safeBottomHeight)

class KBChatRoomController: KBBaseController {
    
    var isScrollBottom = false
    var donotHide = false
    
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
    
    /// 处理键盘通知
    private func handleKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        donotHide = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        donotHide = true
    }
    
    /// 聊天内容列表
    lazy var chatTableView: KBBaseTableView = {
        let chatTableView = KBBaseTableView.init(frame: CGRect.init(x: 0, y: 0, width: view.width, height: view.height - chatInputViewHeight), style: .plain)
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
    
    /// 键盘弹出
    @objc private func keyboardShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String : Any] else {
            return
        }
        guard let keyboardRectValue = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else {
            return
        }
        let keyboardHeight = keyboardRectValue.size.height
        
        chatTableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        chatTableView.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        
        UIView.animate(withDuration: 0.3) {
            self.chatInputView.y = self.view.height - keyboardHeight - chatInputViewHeight
            self.chatTableView.contentOffset = CGPoint.init(x: 0, y: self.chatTableView.contentSize.height - self.chatInputView.y)
        }
    }
    
    /// 键盘收起
    @objc private func keyboardHide(_ notification: Notification) {
        if !donotHide {
            print("走这个方法了")
            chatTableView.contentInset = UIEdgeInsets.zero
            chatTableView.scrollIndicatorInsets = UIEdgeInsets.zero

            UIView.animate(withDuration: 0.3) {
                self.chatInputView.y = self.view.height - chatInputViewHeight
            }
        }
    }
    
    deinit {
        print("聊天页面销毁")
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension KBChatRoomController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isScrollBottom {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
                tableView.scrollToRow(at: IndexPath.init(item: 99, section: 0), at: .bottom, animated: false)
            }
            isScrollBottom = true
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "哈哈\(indexPath.row)"
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
