//
//  KBChatRoomFromCell.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import UIKit

class KBChatRoomFromCell: KBChatRoomCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layerUI()
    }
    
    private func layerUI() {
        _ = headerImageView.sd_layout()?.leftSpaceToView(self, 10)?.topSpaceToView(timeLabel, 10)?.widthIs(50)?.heightIs(50)
        sd_addSubviews([fromMessageLabel])
        _ = fromMessageLabel.sd_layout()?.leftSpaceToView(headerImageView, 10)?.topEqualToView(headerImageView)?.widthIs(200)?.heightIs(40)
    }
    
    lazy var fromMessageBgImageView: KBBaseImageView = {
        let fromMessageBgImageView = KBBaseImageView.init(frame: CGRect.zero)
        return fromMessageBgImageView
    }()
    
    lazy var fromMessageLabel: KBBaseLabel = {
        let fromMessageLabel = KBBaseLabel.init(frame: CGRect.zero)
        return fromMessageLabel
    }()
}
