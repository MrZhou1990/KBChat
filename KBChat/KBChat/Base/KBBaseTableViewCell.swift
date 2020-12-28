//
//  KBBaseTableViewCell.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import UIKit

class KBBaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
