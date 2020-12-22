//
//  KBChatInputView.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/27.
//

import UIKit

class KBChatInputView: KBBaseView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        buildUI()
    }
    
    private func buildUI () {
        addSubview(chatInputView)
        chatInputView.sd_layout()?.spaceToSuperView(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    lazy var chatInputView: KBBaseTextView = {
        let chatInputView = KBBaseTextView.init(frame: CGRect.zero, textContainer: nil)
        chatInputView.backgroundColor = UIColor.yellow
        chatInputView.layer.borderWidth = 1
        chatInputView.layer.borderColor = UIColor.black.cgColor
        return chatInputView
    }()
    
    
}
