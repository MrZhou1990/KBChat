//
//  Message+CoreDataProperties.swift
//  
//
//  Created by 周昊 on 2021/1/18.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }
    
    // 消息内容
    @NSManaged public var content: String?
    // 消息方向（from to）
    @NSManaged public var direction: String?
    // 是否已读
    @NSManaged public var isRead: Bool
    // 消息类型
    @NSManaged public var messageType: String?
    // 消息id
    @NSManaged public var mId: String?
    // 收到消息的时间
    @NSManaged public var receiveTime: Date?
    // 接收人头像
    @NSManaged public var receiveUserHeaderUrl: String?
    // 接收人id
    @NSManaged public var receiveUserId: String?
    // 接收人用户名
    @NSManaged public var receiveUsername: String?
    // 发送时间
    @NSManaged public var sendTime: Date?
    // 发送人头像
    @NSManaged public var sendUserHeaderUrl: String?
    // 发送人id
    @NSManaged public var sendUserId: String?
    // 发送人用户名
    @NSManaged public var sendUsername: String?
    // 备用1
    @NSManaged public var standby1: String?
    // 备用2
    @NSManaged public var standby2: String?
    // 备用3
    @NSManaged public var standby3: String?
    // 备用4
    @NSManaged public var standby4: String?
    // 备用5
    @NSManaged public var standby5: String?

}
