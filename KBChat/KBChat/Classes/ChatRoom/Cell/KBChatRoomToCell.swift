//
//  KBChatRoomToCell.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import UIKit

class KBChatRoomToCell: KBChatRoomCell {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layerUI()
    }
    
    private func layerUI() {
        sd_addSubviews([toMessageLabel])
        _ = headerImageView.sd_layout()?.rightSpaceToView(self, 10)?.topSpaceToView(timeLabel, 10)?.widthIs(50)?.heightIs(50)
        _ = toMessageLabel.sd_layout()?.rightSpaceToView(headerImageView, 10)?.topEqualToView(headerImageView)?.widthIs(200)?.heightIs(40)
    }
    
    lazy var toMessageBgImageView: KBBaseImageView = {
        let toMessageBgImageView = KBBaseImageView.init(frame: CGRect.zero)
        return toMessageBgImageView
    }()
    
    lazy var toMessageLabel: KBBaseLabel = {
        let toMessageLabel = KBBaseLabel.init(frame: CGRect.zero)
        toMessageLabel.textAlignment = .right
        return toMessageLabel
    }()
}
