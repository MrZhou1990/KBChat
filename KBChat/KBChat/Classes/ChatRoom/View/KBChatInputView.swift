//
//  KBChatInputView.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/27.
//

import UIKit

@objc protocol KBChatInputViewDelegate {
    func handleSendMessage(_ message: String)
}

class KBChatInputView: KBBaseView, UITextViewDelegate {
    
    weak var kbDelegate: KBChatInputViewDelegate?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }
    
    private func buildUI() {
        addSubview(safeBgView)
        _ = safeBgView.sd_layout()?.topEqualToView(self)?.leftEqualToView(self)?.rightEqualToView(self)?.heightIs(50)
        safeBgView.addSubview(chatInputView)
        chatInputView.sd_layout()?.spaceToSuperView(UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    lazy var chatInputView: KBBaseTextView = {
        let chatInputView = KBBaseTextView.init(frame: CGRect.zero, textContainer: nil)
        if #available(iOS 13.0, *) {
            chatInputView.backgroundColor = UIColor.systemGray
        } else {
            chatInputView.backgroundColor = UIColor.white
        }
        chatInputView.layer.borderWidth = 1
        chatInputView.layer.borderColor = UIColor.yellow.cgColor
        chatInputView.returnKeyType = .send
        chatInputView.delegate = self
        return chatInputView
    }()
    
    lazy var safeBgView: KBBaseView = {
        let safeBgView = KBBaseView.init(frame: CGRect.zero)
        return safeBgView
    }()
    
}

extension KBChatInputView {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            // 发送网络请求，将消息发送给服务器转发
            KBChatRoomService.sendMessage(textView.text)
            kbDelegate?.handleSendMessage(textView.text)
            textView.text = ""
            return false
        }
        return true
    }
}
