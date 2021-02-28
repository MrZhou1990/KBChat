//
//  Date+KBExtension.swift
//  KBChat
//
//  Created by 周昊 on 2021/2/28.
//

import Foundation

extension Date {
    
    func dateToStringWithFormatter(_ formatterString: String) -> String {
        let formatter = DateFormatter.init()
        formatter.dateFormat = formatterString
        return formatter.string(from: self)
    }
}
