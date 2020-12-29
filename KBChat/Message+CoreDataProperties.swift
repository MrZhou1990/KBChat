//
//  Message+CoreDataProperties.swift
//  
//
//  Created by 周昊 on 2020/12/29.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var mId: String?
    @NSManaged public var sendTime: Date?
    @NSManaged public var sendUsername: String?
    @NSManaged public var sendUserId: String?
    @NSManaged public var sendUserHeaderUrl: String?
    @NSManaged public var isRead: Bool
    @NSManaged public var direction: String?
    @NSManaged public var messageType: String?
    @NSManaged public var content: String?
    @NSManaged public var receiveUsername: String?
    @NSManaged public var receiveUserId: String?
    @NSManaged public var receiveUserHeaderUrl: String?
    @NSManaged public var standby1: String?
    @NSManaged public var standby2: String?
    @NSManaged public var standby3: String?
    @NSManaged public var standby4: String?
    @NSManaged public var standby5: String?

}
