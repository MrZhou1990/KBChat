//
//  KBBaseTextView.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/27.
//

import UIKit

class KBBaseTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        font = UIFont.systemFont(ofSize: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
