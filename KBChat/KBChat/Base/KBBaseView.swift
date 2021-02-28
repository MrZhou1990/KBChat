//
//  KBBaseView.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/27.
//

import UIKit

class KBBaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        if #available(iOS 13.0, *) {
            backgroundColor = UIColor.systemBackground
        } else {
            backgroundColor = UIColor.white
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
