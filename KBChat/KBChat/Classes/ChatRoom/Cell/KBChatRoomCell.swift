//
//  KBChatRoomCell.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import UIKit

class KBChatRoomCell: KBBaseTableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if #available(iOS 13.0, *) {
            backgroundColor = UIColor.systemGray5
        } else {
            backgroundColor = UIColor.white
        }
        buildUI()
    }
    
    private func buildUI() {
        sd_addSubviews([timeLabel, headerImageView, messageTextView])
        _ = timeLabel.sd_layout()?.leftEqualToView(self)?.rightEqualToView(self)?.topEqualToView(self)?.heightIs(30)
    }
    
    /// 时间
    lazy var timeLabel: KBBaseLabel = {
        let timeLabel = KBBaseLabel.init(frame: CGRect.zero)
        timeLabel.textAlignment = .center
        return timeLabel
    }()
    
    /// 头像
    lazy var headerImageView: KBBaseImageView = {
        let headerImageView = KBBaseImageView.init(frame: CGRect.zero)
        headerImageView.backgroundColor = UIColor.cyan
        return headerImageView
    }()
    
    lazy var messageTextView: KBBaseTextView = {
        let leftMessageTextView = KBBaseTextView.init(frame: CGRect.zero)
        return leftMessageTextView
    }()
}
