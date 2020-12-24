//
//  KBBaseTableView.swift
//  KBChat
//
//  Created by 周昊 on 2020/11/25.
//

import UIKit

class KBBaseTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = UIColor.white
        tableFooterView = UIView()
        separatorStyle = .none
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
